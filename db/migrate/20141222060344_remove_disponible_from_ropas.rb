class RemoveDisponibleFromRopas < ActiveRecord::Migration
  def change
    remove_column :ropas, :disponible, :integer
  end
end
