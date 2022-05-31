class AddDescriptionToGigs < ActiveRecord::Migration[7.0]
  def change
    add_column :gigs, :description, :float
  end
end
