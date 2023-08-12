class CreateParks < ActiveRecord::Migration[6.1]
  def change
    create_table :parks do |t|
      t.references :feature, foreign_key: true
      t.references :review, foreign_key: true
      t.string :park_name, null: false, default: ""
      t.string :address, null: false, default: ""
      t.string :park_type, null: false, default: ""
      t.float :latitude
      t.float :longitude
      t.timestamps
    end
  end
end
