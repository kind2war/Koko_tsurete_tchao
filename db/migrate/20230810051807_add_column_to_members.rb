class AddColumnToMembers < ActiveRecord::Migration[6.1]
  def change
    add_column :members, :account_name, :string,  null: false, default: ""
    add_column :members, :birth_date,   :date,    null: false, default: "1991-01-01"
    add_column :members, :sex,          :integer, null: false, default: 0
    add_column :members, :spouse,       :integer, null: false, default: 0
    add_column :members, :children,     :integer, null: false, default: 0
    add_column :members, :prefectures,  :string,  null: false, default: ""
    add_column :members, :city,         :string,  null: false, default: ""
    add_column :members, :is_deleted,   :boolean, null: false, default: false
  end
end
