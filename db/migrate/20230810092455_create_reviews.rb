class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.integer :member_id,  foreign_key: true
      t.integer :park_id,    foreign_key: true
      t.string     :title,   null: false, default: ""
      t.text       :review_detail, null: false
      t.boolean    :draft_flag, default: true
      t.timestamps
    end
  end
end
