require "test_helper"

class Api::V1::ServicesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_v1_services_index_url
    assert_response :success
  end

  test "should create new service" do
    post api_v1_services_create_url
    assert_response :success
  end

  test "should destroy existing service" do
    get api_v1_services_delete_url
    assert_response :success
  end

  test "should get reservation_by_service" do
    get api_v1_services_reservation_by_service_url
    assert_response :success
  end
end
