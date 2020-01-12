class CreateRestoBreakfasts < ActiveRecord::Migration[6.0]
  def change
    create_table :resto_breakfasts do |t|
      t.references :breakfast, null: false, foreign_key: true
      t.references :resto, null: false, foreign_key: true

      t.timestamps
    end
  end
end
