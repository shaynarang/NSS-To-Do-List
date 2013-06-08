require 'test_helper'

class UserDeletesSpecificTask < ActionDispatch::IntegrationTest
  test "delete one task" do
    task = Task.create!(name: "This is the first and only task!")
    assert_equal 1, Task.count
    Task.delete(task)
    assert_equal 0, Task.count
  end

  test "delete multiple tasks" do
    task_one = Task.create!(name: "This is the first task!")
    task_two = Task.create!(name: "This is the second task!")
    task_three = Task.create!(name: "This is the third task!")
    assert_equal 3, Task.count
    Task.delete(task_three)
    visit '/tasks'
    assert_include page.body, "All Tasks"
    assert_include page.body, "This is the second task!"
    assert_include page.body, "This is the first task!"
    assert_equal 2, Task.count
    Task.delete(task_two)
    assert_include page.body, "All Tasks"
    assert_include page.body, "This is the first task!"
    assert_equal 1, Task.count
    Task.delete(task_one)
    assert_equal 0, Task.count
  end
end