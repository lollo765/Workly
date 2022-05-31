class AddCostToGigs < ActiveRecord::Migration[7.0]
  def change
    add_column :gigs, :cost, :float
  end
end
