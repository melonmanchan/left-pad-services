#!/usr/bin/env python

import unittest
import server
import json

class LeftPadTestCase(unittest.TestCase):

    def setUp(self):
        server.app.config["TESTING"] = True
        self.client = server.app.test_client()

    def get_json(self, url):
       return json.loads(self.client.get(url).data)

    def test_should_pad_string(self):
        output = self.get_json("/?str=paddin%27%20oswalt&len=68&ch=@")
        assert output["str"] == '@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@paddin\' oswalt'

    def test_should_handle_missing_paddable_string(self):
        output = self.get_json("/?len=68&ch=@")
        assert output["str"] == '@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@'

    def test_should_handle_missing_char_string(self):
        output = self.get_json("/?str=paddin%27%20oswalt&len=68")
        assert output["str"] == '                                                      paddin\' oswalt'

    def test_should_handle_no_parameters(self):
        output = self.get_json("")
        assert output["str"] == ''

if __name__ == "__main__":
    unittest.main()
