require 'test_helper'

class UserViewsAllLists < ActionDispatch::IntegrationTest
  test "view one list" do
    List.create!(title: "First List!")
    assert_equal 1, List.count
    visit '/lists'
    assert_include page.body, "All Lists"
    assert_include page.body, "First List!"
  end

  test "view multiple lists" do
    List.create!(title: "First List!")
    List.create!(title: "Second List!")
    List.create!(title: "Third List!")
    assert_equal 3, List.count
    visit '/lists'
    assert_include page.body, "All Lists"
    assert_include page.body, "First List!"
    assert_include page.body, "Second List!"
    assert_include page.body, "Third List!"
  end
end