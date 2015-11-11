require 'test_helper'

class IdentityTest < ActiveSupport::TestCase
  def setup
  	@identity = Identity.new(name: "Example User", email:"user@example.com",
  		password: "foobar", password_confirmation:"foobar")
  end

  test "should be valid" do
  	assert @identity.valid?
  end

  test "name should be present" do
  	@identity.name = "      "
  	assert_not @identity.valid?
  end

  test "email should be present" do
  	@identity.email = "      "
  	assert_not @identity.valid?
  end

  test "name should not be too long" do
    @identity.name = "a" * 51
    assert_not @identity.valid?
  end

  test "email should not be too long" do
    @identity.email = "a" * 244 + "@example.com" #256 characters
    assert_not @identity.valid?
  end

  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @identity.email = invalid_address
      assert_not @identity.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  test "email addresses should be unique" do
    duplicate_user = @identity.dup
    @identity.save
    assert_not duplicate_user.valid?
  end

  test "password should be present (nonblank)" do
    @identity.password = @identity.password_confirmation = " " * 6
    assert_not @identity.valid?
  end

  test "password should have a minimum length" do
    @identity.password = @identity.password_confirmation = "a" * 5
    assert_not @identity.valid?
  end
  test "password should have a maximum length" do
    @identity.password = @identity.password_confirmation = "a" * 33
    assert_not @identity.valid?
  end

end
