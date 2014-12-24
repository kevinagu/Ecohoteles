class AddDestinoToEntregas < ActiveRecord::Migration
  def change
    add_reference :entregas, :destino, index: true
  end
end
