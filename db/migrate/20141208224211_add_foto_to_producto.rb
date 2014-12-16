class AddFotoToProducto < ActiveRecord::Migration
  def change
    add_column :productos, :foto, :string
  end
end
