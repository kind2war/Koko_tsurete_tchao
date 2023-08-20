class RemoveParkFromFeatures < ActiveRecord::Migration[6.1]
  def change
    remove_column :features, :park_id, :integer
    remove_column :features, :park, :integer
  end
end
