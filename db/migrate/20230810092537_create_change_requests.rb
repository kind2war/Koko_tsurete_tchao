class CreateChangeRequests < ActiveRecord::Migration[6.1]
  def change
    create_table :change_requests do |t|
      t.references :member, foreign_key: true
      t.references :parks, foreign_key: true
      t.text :order_detail, null: false, default: ""
      t.integer :request_status, null: false, default: 0
      t.timestamps
    end
  end
end
