class RemoveFestureIdFromParks < ActiveRecord::Migration[6.1]
  def change
    remove_column :parks, :feature_id, :intger
  end
end
