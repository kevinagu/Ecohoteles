class CreateRopas < ActiveRecord::Migration
  def change
    create_table :ropas do |t|
      t.string :nombre
      t.integer :recibido
      t.integer :rotas
      t.integer :manchada
      t.integer :disponible
      t.integer :cantidad

      t.timestamps
    end
  end
end
