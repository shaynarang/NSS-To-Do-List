require 'test_helper'

class UserViewsAllTasks < ActionDispatch::IntegrationTest
  test "view one task" do
    @list = List.create
    @list.tasks.create!(name: "This is the first and only task!")
    assert_equal 1, Task.count
    visit '/'
    assert_include page.body, "This is the first and only task!"
  end

  test "view multiple tasks" do
    @list = List.create
    @list.tasks.create!(name: "This is the first task!")
    @list.tasks.create!(name: "This is the second task!")
    @list.tasks.create!(name: "This is the third task!")
    assert_equal 3, Task.count
    visit '/'
    assert_include page.body, "This is the first task!"
    assert_include page.body, "This is the second task!"
    assert_include page.body, "This is the third task!"
  end
end