class Product < ApplicationRecord
    validates :title, :description, :image_url, :price, presence: true 
    validates :price, numericality: { greater_than_or_equal_to: 10 }
    validates :title, uniqueness: true
    validates :image_url, format: {
        with: /\w+\.(jpg|png)\z/i,
        message: "debe ser una imágen JPG o PNG "
      }
end
