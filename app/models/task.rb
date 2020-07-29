class Task < ApplicationRecord
  belongs_to :user
  has_many :task_tags
  has_many :tags, through: :task_tags
  has_one :place, through: :task
  has_one :person, through: :task
  has_one :target
  has_one :action, through: :task

  scope :completed, -> {
    where(:completed => true)
  }

  scope :todo, -> {
    where(:completed => false)
  }

  scope :today, -> {
    where("due_date BETWEEN ? AND ?", '2010-01-01 00:00:00', Date.today.to_s)
  }

  scope :thisweek, -> {
    where(due_date: Time.now.all_week)
  }

  scope :thismonth, -> {
    where(due_date: Time.now.all_month)
  }

end
