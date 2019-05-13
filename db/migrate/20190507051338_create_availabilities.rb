class CreateAvailabilities < ActiveRecord::Migration
  def change
    create_table :availabilities do |t|
      t.string :weekday
      t.string :start_time
      t.string :end_time
    end
  end
end
