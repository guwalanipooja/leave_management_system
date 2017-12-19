class CreateLeaves < ActiveRecord::Migration[5.0]
  def change
    create_table :leaves do |t|
      t.date :start_date
      t.date :end_date
      t.text :reason_for_leave
      t.text :reason_for_rejection
      t.integer :user_id
      t.integer :manager_id
      t.integer :status
      t.timestamps
    end
  end
end
