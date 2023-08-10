class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.references :members, foreign_key: true
      t.references :parks, foreign_key: true
      t.text :review_detail, default: ""
      t.boolean :draft_flag, default: true
      t.timestamps
    end
  end
end
