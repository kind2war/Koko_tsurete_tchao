class CreateFeatures < ActiveRecord::Migration[6.1]
  def change
    create_table :features do |t|
      t.references :park, foreign_key: true
      t.string :feature_detail
      t.timestamps
    end
  end
end
