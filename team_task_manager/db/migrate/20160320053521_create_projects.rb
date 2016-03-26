class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.integer :user_id
      t.date :due_date
      t.boolean :completed, null: false, default: false

      t.timestamps null: false
    end
  end
end
