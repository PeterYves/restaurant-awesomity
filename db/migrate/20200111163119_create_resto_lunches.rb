class CreateRestoLunches < ActiveRecord::Migration[6.0]
  def change
    create_table :resto_lunches do |t|
      t.references :lunch, null: false, foreign_key: true
      t.references :resto, null: false, foreign_key: true

      t.timestamps
    end
  end
end
