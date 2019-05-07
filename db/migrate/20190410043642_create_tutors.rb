class CreateTutors < ActiveRecord::Migration
  def change
    create_table :tutors do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.string :sid
      t.string :year
      t.string :major
      t.string :minor
      t.string :experiences
      t.string :weekday
      t.string :start_time
      t.string :end_time
      t.string :preferred_grade
      t.string :in_class
      t.string :instrument
      t.string :private
      t.string :piano_vocal
      t.string :returning
      t.string :prev_again
      t.string :preffered_student_class
      t.string :comment
      t.timestamps null: false
    end
  end
end
