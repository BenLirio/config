package main

import (
    "crypto/aes"
    "crypto/rand"
    "io"
    "os"
    "fmt"
    "errors"
)

var keyLen uint = 32

type Args struct {
    Source  string
    Destination string
    Key []byte
}

func KeyStringToByteBlock(keyString string) ([]byte, error) {
    if len(keyString) > 32 {
        return []byte{}, errors.New("Key length must be less than 32")
    }
    keyBlock := make([]byte, keyLen)
    for i := 0; i < len(keyString); i++ {
        keyBlock[i] = keyString[i]
    }
    return keyBlock, nil
}

func GetArgs() (Args, error) {
    if len(os.Args) != 4 {
        return Args{}, errors.New("encrypt [src] [dst] [key]")
    }
    keyString := os.Args[3]
    key, err := KeyStringToByteBlock(keyString)
    if err != nil {
        return Args{}, err
    }
    return Args{os.Args[1], os.Args[2], key}, nil

}

func NonceBytes(data []byte) {
    for i := 1; i < len(data); i++ {
        _, err := rand.Read(data[i:i+1])
        if err != nil {
            fmt.Println(err)
            os.Exit(1)
        }
        if data[i] == 0 {
            i--
        }
    }
}

func main() {
    args, err := GetArgs()
    if err != nil {
        fmt.Println(err)
        os.Exit(1)
    }

    block, err := aes.NewCipher(args.Key)
    if err != nil {
        fmt.Println(err)
        os.Exit(1)
    }

    sourceFile, err := os.Open(args.Source)
    if err != nil {
        fmt.Println(err)
        os.Exit(1)
    }
    defer sourceFile.Close()


    destinationFile, err := os.Create(args.Destination)
    if err != nil {
        fmt.Println(err)
        os.Exit(1)
    }
    defer destinationFile.Close()



    plainBytes := make([]byte, aes.BlockSize)
    encryptedBytes := make([]byte, aes.BlockSize)
    capped := false
    for {
        n, err := sourceFile.Read(plainBytes)
        if err == io.EOF || n == 0 {
            break
        }
        if err != nil {
            fmt.Println(err)
            os.Exit(1)
        }
        if n < aes.BlockSize {
            capped = true
            plainBytes[n] = 0
            NonceBytes(plainBytes[n+1:len(plainBytes)])
        }
        block.Encrypt(encryptedBytes, plainBytes)
        destinationFile.Write(encryptedBytes)
    }
    if capped == false {
        plainBytes[0] = 0
        NonceBytes(plainBytes[1:len(plainBytes)])
        block.Encrypt(encryptedBytes, plainBytes)
        destinationFile.Write(encryptedBytes)
    }
}
