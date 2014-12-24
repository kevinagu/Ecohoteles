class Recibido < ActiveRecord::Base
  belongs_to :ropa
  belongs_to :user
  belongs_to :procedencia
end
