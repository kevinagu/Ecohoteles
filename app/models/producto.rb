class Producto < ActiveRecord::Base
  mount_uploader :foto, PictureUploader
  belongs_to :umedida
  belongs_to :seccion

  def self.search(query)
    # where(:title, query) -> This would return an exact match of the query
    where("nombre like ?", "%#{query}%") 
  end
end
