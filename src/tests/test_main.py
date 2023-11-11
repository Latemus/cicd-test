import unittest

from src.bot.main import system_architecture


class TestArchitectureDetection(unittest.TestCase):
    def test_architecture(self):
        """
        Test if the get_system_architecture function returns a valid architecture string (not empty).
        """
        arch = system_architecture
        self.assertTrue(arch)  # Check that the architecture is a truthy string


if __name__ == '__main__':
    unittest.main()
