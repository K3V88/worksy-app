require "test_helper"

class UserJobsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_jobs_index_url
    assert_response :success
  end
end
