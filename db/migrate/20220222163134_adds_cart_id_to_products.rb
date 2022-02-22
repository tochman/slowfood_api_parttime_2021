class AddsCartIdToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :cart_id, :integer
  end
end
