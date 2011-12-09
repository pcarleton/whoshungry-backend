class AddCommentToFoodTime < ActiveRecord::Migration
  def change
    add_column :food_times, :comment, :string
  end
end
