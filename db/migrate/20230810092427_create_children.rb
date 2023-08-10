class CreateChildren < ActiveRecord::Migration[6.1]
  def change
    create_table :children do |t|
      t.references :members, foreign_key: true
      t.integer :sex, null: false, default: 0
      t.date :birth_date, null: false, default: "2020-01-01"
      t.timestamps
    end
  end
end
