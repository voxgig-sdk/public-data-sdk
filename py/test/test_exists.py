# PublicData SDK exists test

import pytest
from publicdata_sdk import PublicDataSDK


class TestExists:

    def test_should_create_test_sdk(self):
        testsdk = PublicDataSDK.test(None, None)
        assert testsdk is not None
