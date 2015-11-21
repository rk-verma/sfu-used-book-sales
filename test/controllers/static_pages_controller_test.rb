require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
<<<<<<< HEAD
  test "should get about" do
    get :about
    assert_response :success
  end

  test "should get home" do
    get :home
    assert_response :success
=======
  test "should get home" do
    get :home
    assert_response :success
    assert_select "title", "HOME"
  end

  test "should get about" do
    get :about
    assert_response :success
    assert_select "title", "ABOUT"
>>>>>>> f35313dac63ed0e3dd3a108a401f168eca043220
  end

  test "should get contact" do
    get :contact
    assert_response :success
<<<<<<< HEAD
=======
    assert_select "title", "CONTACT"
>>>>>>> f35313dac63ed0e3dd3a108a401f168eca043220
  end

  test "should get profile" do
    get :profile
    assert_response :success
<<<<<<< HEAD
=======
    assert_select "title", "PROFILE"
>>>>>>> f35313dac63ed0e3dd3a108a401f168eca043220
  end

end
