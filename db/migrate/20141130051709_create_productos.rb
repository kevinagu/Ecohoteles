class CreateProductos < ActiveRecord::Migration
  def change
    create_table :productos do |t|
      t.string :nombre
      t.string :marca
      t.references :umedida, index: true
      t.float :pcosto
      t.float :pventa
      t.float :cantidad
      t.integer :stock
      t.references :seccion, index: true

      t.timestamps
    end
  end
end
