import spam

def test_get_version_nonempty():
    v = spam.get_version()
    assert isinstance(v, str)
    assert v.strip() != ""

def test_get_version_looks_like_glpk():
    v = spam.get_version().lower()
    assert "4." in v or "5." in v or "glpk" in v