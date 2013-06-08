require 'test_helper'

class UserDeletesAllTasks < ActionDispatch::IntegrationTest
  test "delete one task" do
  	task = Task.create!(name: "This is the first and only task!")
    assert_equal 1, Task.count
    task.destroy
    assert_equal 0, Task.count
  end

  test "delete multiple tasks" do
  	task_one = Task.create!(name: "This is the first task!")
  	task_two = Task.create!(name: "This is the second task!")
  	task_three = Task.create!(name: "This is the third task!")
    assert_equal 3, Task.count
    task_one.destroy
    assert_equal 2, Task.count
    task_two.destroy
    assert_equal 1, Task.count
  end
end