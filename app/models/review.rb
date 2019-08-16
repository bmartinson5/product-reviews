class Review < ApplicationRecord
  belongs_to :product

  #validations
  validates :product_id, presence: true
  validates :author, presence: true
  validates :rating, presence: true
  validates_inclusion_of :rating, in: 1..5
  validates :content_body, presence: true
  validates_length_of :content_body, in: 50..250

end
