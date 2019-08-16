class Product < ApplicationRecord
  has_many :reviews, :dependent => :delete_all

  #scopes
  scope :most_reviewed, -> {(
    select("products.id, products.name, count(reviews.id) as reviews_count")
    .joins(:reviews)
    .group("products.id")
    .limit(1)
  )}
  scope :local_products, -> { where(country_of_origin: "USA")}
  scope :recently_added, -> { order(id: :desc).limit(3)}

  #validations
  validates :name, presence: true
  validates :cost, presence: true
  validates :country_of_origin, presence: true


  #helper method
  def calc_avg_rating()
    if self.reviews.length == 0
      return 0
    end
    sum = self.reviews.reduce(0) { |sum, review| sum + review.rating}
    return sum / self.reviews.length
  end
  
  #callback
  before_save(:titleize_name)
  private
    def titleize_name
      self.name = self.name.titleize
    end


end
