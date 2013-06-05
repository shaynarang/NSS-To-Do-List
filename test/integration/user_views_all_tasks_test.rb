require 'test_helper'

class UserViewsAllTasks < ActionDispatch::IntegrationTest
  test "view all tasks" do
    Task.create!(name: "This is the first task!")
    Task.create!(name: "This is the second task!")
    assert_equal 2, Task.count
    visit '/tasks'
    assert_include page.body, "All Tasks"
    assert_include page.body, "This is the first task!"
    assert_include page.body, "This is the second task!"
  end
end