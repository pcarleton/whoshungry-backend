class CreateFoodTimes < ActiveRecord::Migration
  def change
    create_table :food_times do |t|
      t.integer :user_id
      t.integer :start
      t.integer :end
      t.integer :dow

      t.timestamps
    end
  end
end
