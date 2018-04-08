class CreateOrdersFoods < ActiveRecord::Migration[5.1]
  def change
    create_table :orders_foods do |t|
      t.references :food, foreign_key: true
      t.references :order, foreign_key: true

      t.timestamps
    end
  end
end
