class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.string :class_name
      t.string :school_name
      t.string :grade
      t.string :time_availability
      t.string :instruments
      t.string :comment
      t.timestamps null: false
    end
  end
end
