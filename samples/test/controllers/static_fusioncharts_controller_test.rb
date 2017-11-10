require 'test_helper'

class StaticFusionchartsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get static_fusioncharts_index_url
    assert_response :success
  end

end
