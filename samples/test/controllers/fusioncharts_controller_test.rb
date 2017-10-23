require 'test_helper'

class FusionchartsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get fusioncharts_index_url
    assert_response :success
  end

end
