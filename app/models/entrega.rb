class Entrega < ActiveRecord::Base
  belongs_to :ropa
  belongs_to :user
end
