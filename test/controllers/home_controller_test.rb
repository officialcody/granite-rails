require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  def test_should_get_successfully_from_root_url
    get root_url
    assert_response :success
  end
end
