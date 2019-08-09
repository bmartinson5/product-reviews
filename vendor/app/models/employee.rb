class Employee < ApplicationRecord
  scope :search, -> (name_parameter) { where("name like ?", "%#{name_parameter}%")}
  
  has_many :employee_projects
  has_many :projects, :through => :employee_projects
  belongs_to :division
end
