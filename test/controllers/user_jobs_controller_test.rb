require "test_helper"

class UserJobsControllerTest < ActionDispatch::IntegrationTest
  # Include Devise test helpers
  include Devise::Test::IntegrationHelpers

  test "should get index" do
    # Create a user (you can also use fixtures or factory for this)
    user = users(:one)  # Assuming you have a fixture for users

    # Log in the user (this makes the test act as if the user is logged in)
    sign_in user

    # Now, test the 'index' action
    get user_jobs_path(user)
    assert_response :success
  end
end
