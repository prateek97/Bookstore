class AddViewCountToFoodItem < ActiveRecord::Migration[5.0]
  def change
    add_column :food_items, :view_counter, :integer, default: 0
  end
end
