class AddBmrToInformation < ActiveRecord::Migration[5.0]
  def change
    add_column :information, :bmr, :float
  end
end
