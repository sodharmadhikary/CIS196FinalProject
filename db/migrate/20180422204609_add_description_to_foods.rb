class AddDescriptionToFoods < ActiveRecord::Migration[5.1]
  def change
    add_column :foods, :description, :text
  end
end
