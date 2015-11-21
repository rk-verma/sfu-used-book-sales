require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  test "layout links on homepage" do
    get root_path
    assert_template 'static_pages/home'
    assert_select "a[href=?]", root_path, count: 2
    assert_select "a[href=?]", help_path
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", contact_path
  end

  test "layout links on profile page" do
  	get help_path
  	assert_template 'static_pages/help'
  	assert_select "a[href=?]", root_path, count: 2
    assert_select "a[href=?]", help_path
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", contact_path
   end

   test "layout links on contact page" do
     get contact_path
     assert_template 'static_pages/contact'
   	 assert_select "a[href=?]", root_path, count: 2
     assert_select "a[href=?]", help_path
     assert_select "a[href=?]", about_path
     assert_select "a[href=?]", contact_path
   end

   test "layout links on about page" do
     get contact_path
     assert_template 'static_pages/about'
   	 assert_select "a[href=?]", root_path, count: 2
     assert_select "a[href=?]", help_path
     assert_select "a[href=?]", about_path
     assert_select "a[href=?]", contact_path
   end

end
