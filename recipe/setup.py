from setuptools import setup, Extension
from Cython.Build import cythonize
import os

library_dir = os.environ.get("LIBRARY_LIB") or os.path.join(os.environ["PREFIX"], "lib")
include_dir = os.environ.get("LIBRARY_INC") or os.path.join(os.environ["PREFIX"], "include")

ext = Extension(
    "spam",
    sources=["spam.pyx"],
    include_dirs=[include_dir],
    library_dirs=[library_dir],
    libraries=["glpk"],
)

setup(
    name="spam",
    version="0.0.0",
    ext_modules=cythonize([ext], language_level="3"),
)