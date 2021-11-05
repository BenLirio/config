import vim
from math import *
from scipy.stats import *

r = vim.current.range
if r.start is r.end:
	try:
		r.append(str(eval(r[0])))
	except:
		print("bad")
