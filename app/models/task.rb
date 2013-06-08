class Task < ActiveRecord::Base
  has_one :list
  attr_accessible :name
end
