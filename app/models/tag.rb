class Tag < ApplicationRecord
  has_many :tasks_tags
  has_many :tasks, through: :tasks_tags
end
