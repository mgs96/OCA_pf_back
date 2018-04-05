require 'test_helper'

class Api::V1::ApoyosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_v1_apoyos_index_url
    assert_response :success
  end

  test "should get scrape" do
    get api_v1_apoyos_scrape_url
    assert_response :success
  end

end
