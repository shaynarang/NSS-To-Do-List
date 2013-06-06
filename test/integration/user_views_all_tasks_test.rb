require 'test_helper'

class UserViewsAllTasks < ActionDispatch::IntegrationTest
  test "view one task" do
    Task.create!(name: "This is the first and only task!")
    assert_equal 1, Task.count
    visit '/tasks'
    assert_include page.body, "All Tasks"
    assert_include page.body, "This is the first and only task!"
  end

  test "view multiple tasks" do
    Task.create!(name: "This is the first task!")
    Task.create!(name: "This is the second task!")
    Task.create!(name: "This is the third task!")
    assert_equal 3, Task.count
    visit '/tasks'
    assert_include page.body, "All Tasks"
    assert_include page.body, "This is the first task!"
    assert_include page.body, "This is the second task!"
    assert_include page.body, "This is the third task!"
  end
end