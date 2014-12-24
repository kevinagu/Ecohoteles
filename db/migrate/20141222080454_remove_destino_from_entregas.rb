class RemoveDestinoFromEntregas < ActiveRecord::Migration
  def change
    remove_column :entregas, :destino, :string
  end
end
