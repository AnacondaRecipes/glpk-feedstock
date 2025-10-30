# this should get compiled to spam.c by cython

cdef extern from "glpk.h":
    const char *glp_version()

import unittest    


def get_version():
    return bytes(glp_version()).decode("utf-8", "ignore")


class Tester(unittest.TestCase):

    def test(self):
        return get_version()


suite = unittest.defaultTestLoader.loadTestsFromTestCase(Tester)
