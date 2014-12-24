class RemoveProcedenciaFromRopas < ActiveRecord::Migration
  def change
    remove_reference :ropas, :procedencia, index: true
  end
end
