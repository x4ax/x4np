import pytest
from x4np import demo_np

def test_demo():
    a = demo_np.make_array()
    assert a.ndim == 2