class AddHomeScoreToTasks < ActiveRecord::Migration[6.0]
  def change
    add_column :tasks, :home_score, :integer
  end
end
