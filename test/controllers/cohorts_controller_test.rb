require 'test_helper'

class CohortsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get cohorts_show_url
    assert_response :success
  end

end
