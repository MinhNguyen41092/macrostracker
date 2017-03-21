class AddGenderToInformation < ActiveRecord::Migration[5.0]
  def change
    add_column :information, :gender, :integer
  end
end
