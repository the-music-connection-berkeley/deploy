class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.string :tutor_id
      t.string :tutee_id
      t.string :color
    end
  end
end
