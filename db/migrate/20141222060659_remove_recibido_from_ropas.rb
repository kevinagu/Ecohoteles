class RemoveRecibidoFromRopas < ActiveRecord::Migration
  def change
    remove_column :ropas, :recibido, :integer
  end
end
