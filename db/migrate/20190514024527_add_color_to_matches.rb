class AddColorToMatches < ActiveRecord::Migration
  def change
    add_column :matches, :color, :string
  end
end
