class Person < ApplicationRecord
  belongs_to :task, optional: true

end
