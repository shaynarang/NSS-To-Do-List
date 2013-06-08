require 'test_helper'

class UserDeletesSpecificList < ActionDispatch::IntegrationTest
  test "delete one list" do
    list = List.create!(title: "List One!")
    assert_equal 1, List.count
    List.delete(list)
    assert_equal 0, List.count
  end

  test "delete multiple lists" do
    list_one = List.create!(title: "List One!")
    list_two = List.create!(title: "List Two!")
    list_three = List.create!(title: "List Three!")
    assert_equal 3, List.count
    List.delete(list_three)
    visit '/lists'
    assert_include page.body, "All Lists"
    assert_include page.body, "List Two!"
    assert_include page.body, "List One!"
    assert_equal 2, List.count
    List.delete(list_two)
    assert_include page.body, "All Lists"
    assert_include page.body, "List One!"
    assert_equal 1, List.count
    List.delete(list_one)
    assert_equal 0, List.count
  end
end