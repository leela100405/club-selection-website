class CreateRegistrations < ActiveRecord::Migration[7.1]
  def change
    create_table :registrations do |t|
      t.string :student_name, null: false
      t.string :student_class, null: false
      t.string :section, null: false
      t.string :email, null: false
      t.string :club, null: false
      t.timestamps
    end
    add_index :registrations, :email, unique: true
  end
end
