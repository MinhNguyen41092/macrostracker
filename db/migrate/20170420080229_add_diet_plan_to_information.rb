class AddDietPlanToInformation < ActiveRecord::Migration[5.0]
  def change
    add_column :information, :diet_plan, :integer
  end
end
