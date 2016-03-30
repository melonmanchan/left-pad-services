#!/usr/bin/env python

import unittest
import server

class LeftPadTestCase(unittest.TestCase):

    def setUp(self):
        server.app.config["TESTING"] = True
        self.client = server.app.test_client()

if __name__ == "__main__":
    unittest.main()
