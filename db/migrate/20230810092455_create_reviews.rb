class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.references :member,  foreign_key: true
      t.references :park,    foreign_key: true
      t.string     :title,   null: false, default: ""
      t.text       :review_detail, null: false
      t.boolean    :draft_flag, default: true
      t.timestamps
    end
  end
end
