class CreateFeatures < ActiveRecord::Migration[6.1]
  def change
    create_table :features do |t|
     # t.integer :park_id, foreign_key: true
      t.string :feature_detail, uniqe: true
      t.timestamps
    end
    add_index :features, :feature_detail
  end
end
