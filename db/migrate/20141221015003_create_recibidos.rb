class CreateRecibidos < ActiveRecord::Migration
  def change
    create_table :recibidos do |t|
      t.references :ropa, index: true
      t.integer :cantidad
      t.integer :rotas
      t.integer :manchada
      t.string :procedencia
      t.references :user, index: true

      t.timestamps
    end
  end
end
