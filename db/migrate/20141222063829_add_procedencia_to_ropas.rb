class AddProcedenciaToRopas < ActiveRecord::Migration
  def change
    add_reference :ropas, :procedencia, index: true
  end
end
