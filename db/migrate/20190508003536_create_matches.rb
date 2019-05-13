class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.string :tutor_id
      t.string :tutee_id
    end
  end
end
