class CreateParents < ActiveRecord::Migration
  def change
    create_table :parents do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.string :address
      t.string :grade
      t.string :piano_home
      t.string :availabilities
      t.string :instrument
      t.string :experiences
      t.string :pastapp
      t.string :lunch
      t.string :comment
      t.integer :number_of_matches
      t.boolean :matched
      t.timestamps null: false
    end
  end
end
