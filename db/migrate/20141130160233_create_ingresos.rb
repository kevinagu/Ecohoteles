class CreateIngresos < ActiveRecord::Migration
  def change
    create_table :ingresos do |t|
      t.references :producto, index: true
      t.references :user, index: true
      t.float :cantidad

      t.timestamps
    end
  end
end
