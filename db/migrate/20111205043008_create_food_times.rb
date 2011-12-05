class CreateFoodTimes < ActiveRecord::Migration
  def change
    create_table :food_times do |t|
      t.integer :avail_id
      t.integer :dow
      t.string :start
      t.string :end

      t.timestamps
    end
  end
end
