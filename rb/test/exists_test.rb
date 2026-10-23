# PublicData SDK exists test

require "minitest/autorun"
require_relative "../PublicData_sdk"

class ExistsTest < Minitest::Test
  def test_create_test_sdk
    testsdk = PublicDataSDK.test(nil, nil)
    assert !testsdk.nil?
  end
end
