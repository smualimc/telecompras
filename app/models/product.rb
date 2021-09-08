class Product < ApplicationRecord
  has_many :line_items
  before_destroy :ensure_not_referenced_by_any_line_item


    validates :title, :description, :image_url, :price, presence: true 
    validates :price, numericality: { greater_than_or_equal_to: 10 }
    validates :title, uniqueness: true
    validates :image_url, format: {
        with: /\w+\.(jpg|png)\z/i,
        message: "debe ser una imágen JPG o PNG "
      }

      private

      def ensure_not_referenced_by_any_line_item
        unless line.items.empty?
          errors.add(:base, 'Line Items present')
            throw :abort
        end
      end 
end
