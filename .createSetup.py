import py_compile as pc
import os

pc.compile(".setup.py", "setup")
os.system("chmod 640 setup")
