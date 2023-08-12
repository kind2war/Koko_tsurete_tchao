class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.references :member, foreign_key: true
      t.references :park, foreign_key: true
      t.text :review_detail, default: ""
      t.boolean :draft_flag, default: true
      t.timestamps
    end
  end
end
