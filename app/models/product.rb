class Product < ApplicationRecord
  scope :most_reviewed, -> {(
    select("products.id, products.name, count(reviews.id) as reviews_count")
    .joins(:reviews)
    .group("products.id")
    .limit(1)
  )}

  scope :local_products, -> { where(country_of_origin: "USA")}

  scope :recently_added, -> { order(id: :desc).limit(3)}

  has_many :reviews, :dependent => :delete_all
end
