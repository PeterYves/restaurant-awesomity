class CreateRestos < ActiveRecord::Migration[6.0]
  def change
    create_table :restos do |t|
      t.string :name
      t.string :location
      t.text :photo
      t.text :website
      t.text :online_delivery
      t.text :table_booking
      t.text :cuisine
      t.text :currency
      t.text :price_range

      t.timestamps
    end
  end
end
