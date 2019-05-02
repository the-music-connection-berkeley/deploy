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
      t.string :in_class
      t.string :instruments
      t.string :time_availavility
      t.string :preferred_grade
      t.string :private
      t.string :piano
      t.string :returning
      t.string :prev_again
      t.string :interview_time
      t.timestamps null: false
    end
  end
end
