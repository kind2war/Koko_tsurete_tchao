class AddColumnAreaToParks < ActiveRecord::Migration[6.1]
  def change
    add_column :parks, :area, :string
    add_column :parks, :size_rank, :string
    add_column :parks, :size, :integer
  end
end
