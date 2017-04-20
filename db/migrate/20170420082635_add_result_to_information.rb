class AddResultToInformation < ActiveRecord::Migration[5.0]
  def change
    add_column :information, :result, :float
  end
end
