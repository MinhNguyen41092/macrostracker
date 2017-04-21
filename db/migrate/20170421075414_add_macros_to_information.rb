class AddMacrosToInformation < ActiveRecord::Migration[5.0]
  def change
    add_column :information, :protein, :float
    add_column :information, :carb, :float
    add_column :information, :fat, :float
  end
end
