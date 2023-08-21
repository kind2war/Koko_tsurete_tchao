class CreateReviewComments < ActiveRecord::Migration[6.1]
  def change
    create_table :review_comments do |t|
      t.text :comment, null: false
      t.integer :member_id, foreign_key: true
      t.integer :park_id, foreign_key: true
      t.timestamps
    end
  end
end
