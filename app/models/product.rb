class Product < ApplicationRecord
    
    has_many :line_items
    before_destroy :ensure_not_referenced_by_any_line_item
    
# end
#class Product < ApplicationRecord
validates :title, :description, :image_url, presence: true
validates :price, numericality: {greater_than_or_equal_to: 0.01}
validates :title, uniqueness: true
validates :image_url, allow_blank: true, format: {
with: %r{\A\w+\.(gif|jpg|png)\z}i,
# with: %r{\A\.(gif|jpg|png)\Z\z}i,
#with: %r{\A\w+\.(gif|jpg|png)\z}i,
message: 'must be a URL for GIF, JPG or PNG image; no whitespace. '
}

private
# ensure that there are no line items referencing this product
  def ensure_not_referenced_by_any_line_item
    unless line_items.empty?
     errors.add(:base, 'Line Items Present')
    throw :abort
    end
  end
end