class Product < ApplicationRecord
  scope :most_reviewed, -> () {select ("select products from products inner join reviews on products.id = reviews.product_id group by products order by count(reviews.id) desc limit 1")}

  has_many :reviews, :dependent => :delete_all
end
