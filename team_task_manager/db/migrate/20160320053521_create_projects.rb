class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.integer :user_id
      t.datetime :due_date
      t.boolean :completed

      t.timestamps null: false
    end
  end
end
