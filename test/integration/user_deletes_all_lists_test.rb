require 'test_helper'

class UserDeletesAllLists < ActionDispatch::IntegrationTest
  test "delete one list" do
    List.create!(title: "This is the first and only list!")
    assert_equal 1, List.count
    List.delete_all
    assert_equal 0, List.count
  end

  test "delete multiple lists" do
    List.create!(title: "This is the first list!")
    List.create!(title: "This is the second list!")
    List.create!(title: "This is the third list!")
    assert_equal 3, List.count
    List.delete_all
    assert_equal 0, List.count
  end
end