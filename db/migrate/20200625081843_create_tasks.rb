class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.datetime :due_date
      t.references :place, foreign_key: true
      t.references :person, foreign_key: true
      t.references :target, foreign_key: true
      t.references :action, foreign_key: true
      t.references :user, foreign_key: true
      t.text :memo
      t.timestamps
    end
  end
end
