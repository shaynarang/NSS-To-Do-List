require 'test_helper'

class UserDeletesSpecificTask < ActionDispatch::IntegrationTest
  test "delete task" do
    @list = List.create
    @list.tasks.create!(name: "This is the first task!")
    assert_equal 1, Task.count
    @list.tasks.create!(name: "This is the second task!")
    assert_equal 2, Task.count
    @list.tasks.find(:first, :conditions => [ "name = ?", "This is the second task!"]).destroy
    assert_equal 1, Task.count
  end
end