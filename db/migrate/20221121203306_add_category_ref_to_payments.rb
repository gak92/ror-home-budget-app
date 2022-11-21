class AddCategoryRefToPayments < ActiveRecord::Migration[7.0]
  def change
    add_reference :payments, :category, null: false, foreign_key: true
  end
end
