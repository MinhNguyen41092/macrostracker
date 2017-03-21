class CreateInformation < ActiveRecord::Migration[5.0]
  def change
    create_table :information do |t|
      t.integer :weight
      t.integer :height
      t.integer :age
      t.boolean :sex
      t.integer :activity_level
      t.integer :user_id

      t.timestamps
    end
  end
end
