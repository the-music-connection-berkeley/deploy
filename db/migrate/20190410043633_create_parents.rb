class CreateParents < ActiveRecord::Migration
  def change
    create_table :parents do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.string :address
      t.string :piano
      t.string :grade
      t.string :instruments
      t.string :experiences
      t.string :pastapp
      t.string :lunch
      t.timestamps null: false
    end
  end
end
