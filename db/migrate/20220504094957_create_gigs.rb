class CreateGigs < ActiveRecord::Migration[7.0]
  def change
    create_table :gigs do |t|
      t.string :title
      t.string :categories
      t.string :skill
      t.string :currency

      t.timestamps
    end
  end
end
