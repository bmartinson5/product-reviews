class Review < ApplicationRecord
  def self.filter_by(author, rating)
    scope = where("author like ?", "%#{author}%")
    scope = scope.where(rating: rating) unless rating.blank?
    scope
  end

  belongs_to :product
  belongs_to :user

  #validations
  validates :product_id, presence: true
  validates :author, presence: true
  validates :rating, presence: true
  validates_inclusion_of :rating, in: 1..5
  validates :content_body, presence: true
  validates_length_of :content_body, in: 50..250

end
