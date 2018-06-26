class CreateActivityLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :activity_logs do |t|
      t.integer :user_id, null: false, index: true
      t.integer :attached_id, index: true
      t.string :model, index: true
      t.string :action, index: true

      t.timestamps
    end
  end
end
