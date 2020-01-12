class AddBreakfastToRestos < ActiveRecord::Migration[6.0]
  def change
    add_reference :restos, :breakfast, foreign_key: true
  end
end
