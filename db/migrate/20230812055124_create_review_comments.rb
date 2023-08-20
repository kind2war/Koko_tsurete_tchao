class CreateReviewComments < ActiveRecord::Migration[6.1]
  def change
    create_table :review_comments do |t|
      t.text :comment, null: false
      t.references :member, foreign_key: true
      t.references :park, foreign_key: true
      t.timestamps
    end
  end
end
