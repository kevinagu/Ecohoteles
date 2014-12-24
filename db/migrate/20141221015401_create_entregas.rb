class CreateEntregas < ActiveRecord::Migration
  def change
    create_table :entregas do |t|
      t.references :ropa, index: true
      t.integer :cantidad
      t.integer :rotas
      t.integer :manchada
      t.string :destino
      t.references :user, index: true

      t.timestamps
    end
  end
end
