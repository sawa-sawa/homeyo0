class Target < ApplicationRecord
  belongs_to :task, optional: true
end
