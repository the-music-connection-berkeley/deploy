class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.string :class_name
      t.string :school_name
      t.string :grade
      t.string :availabilities
      t.string :instrument
      t.string :comment
      t.integer :number_of_matches
      t.boolean :matched
      t.timestamps null: false
    end
  end
end
