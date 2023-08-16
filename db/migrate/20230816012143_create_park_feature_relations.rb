class CreateParkFeatureRelations < ActiveRecord::Migration[6.1]
  def change
    create_table :park_feature_relations do |t|

      t.timestamps
    end
  end
end
