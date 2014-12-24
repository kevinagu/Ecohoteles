class CreateProcedencia < ActiveRecord::Migration
  def change
    create_table :procedencia do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
