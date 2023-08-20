class CreateParkFeatureRelations < ActiveRecord::Migration[6.1]
  def change
    create_table :park_feature_relations do |t|
      t.references :park, foreign_key: true
      t.references :feature, foreign_key: true
      t.timestamps
    end
    add_index :park_feature_relations, [:park_id, :feature_id], unique: true
  end
end

