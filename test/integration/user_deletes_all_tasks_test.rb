require 'test_helper'

class UserDeletesAllTasks < ActionDispatch::IntegrationTest
  test "delete one task" do
    Task.create!(name: "This is the first and only task!")
    assert_equal 1, Task.count
    Task.destroy_all
    assert_equal 0, Task.count
  end

  test "delete multiple tasks" do
    Task.create!(name: "This is the first task!")
    Task.create!(name: "This is the second task!")
    Task.create!(name: "This is the third task!")
    assert_equal 3, Task.count
    Task.destroy_all
    assert_equal 0, Task.count
  end
end