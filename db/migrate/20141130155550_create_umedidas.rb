class CreateUmedidas < ActiveRecord::Migration
  def change
    create_table :umedidas do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
