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
      t.string :availabilities
      t.string :preferred_grade
      t.string :in_class
      t.string :instrument
      t.string :private
      t.string :returning
      t.string :prev_again
      t.string :preferred_student_class
      t.string :comment
      t.integer :number_of_matches
      t.boolean :matched
      t.timestamps null: false
    end
  end
end
