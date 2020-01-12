class AddLunchToRestos < ActiveRecord::Migration[6.0]
  def change
    add_reference :restos, :lunch, foreign_key: true
  end
end
