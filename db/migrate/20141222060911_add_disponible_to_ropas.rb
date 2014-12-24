class AddDisponibleToRopas < ActiveRecord::Migration
  def change
    add_column :ropas, :disponible, :integer
  end
end
