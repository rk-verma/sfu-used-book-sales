require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  def test_create
      post(:create, user: { name: "Example User", email:"user@example.com",
    		password: "foobar", password_confirmation:"foobar"})
      assert_response :found
      assert_not_nil User.find_by(name: "Example User", email:"user@example.com",
    		password: "foobar", password_confirmation:"foobar")
  end

end
