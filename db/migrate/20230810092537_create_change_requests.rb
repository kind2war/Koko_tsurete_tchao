class CreateChangeRequests < ActiveRecord::Migration[6.1]
  def change
    create_table :change_requests do |t|
      t.integer :member_id, foreign_key: true
      t.integer :park_id,   foreign_key: true
      t.text :order_detail, null: false
      t.integer :request_status, null: false, default: 0
      t.timestamps
    end
  end
end
