class Product < ApplicationRecord
  has_many :reviews, :dependent => :delete_all
end
