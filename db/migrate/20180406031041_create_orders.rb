class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.string :name
      t.datetime :date

      t.timestamps
    end
  end
end
