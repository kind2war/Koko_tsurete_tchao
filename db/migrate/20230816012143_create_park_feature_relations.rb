class CreateParkFeatureRelations < ActiveRecord::Migration[6.1]
  def change
    create_table :park_feature_relations do |t|
      t.references :park, foreign_key: true
      t.references :feature, foreign_key: true
      t.timestamps
    end
  end
end
