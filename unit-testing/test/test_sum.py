import unittest
from my_sum.common import sum


class TestSum(unittest.TestCase):
    def test_list_int(self):
        """
        Testing my own sum function on integer list
        """
        data = [1, 2, 3]
        result = sum(data)
        self.assertEqual(result, 6)


if __name__ == "__main__":
    unittest.main()
