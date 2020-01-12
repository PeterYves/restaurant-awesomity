class AddUserToResto < ActiveRecord::Migration[6.0]
  def change
    add_reference :restos, :user, null: false, foreign_key: true
  end
end
