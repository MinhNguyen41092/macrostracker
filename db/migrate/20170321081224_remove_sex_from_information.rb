class RemoveSexFromInformation < ActiveRecord::Migration[5.0]
  def change
    remove_column :information, :sex, :boolean
  end
end
