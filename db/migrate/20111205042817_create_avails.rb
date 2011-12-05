class CreateAvails < ActiveRecord::Migration
  def change
    create_table :avails do |t|
      t.integer :user_id

      t.timestamps
    end
  end
end
