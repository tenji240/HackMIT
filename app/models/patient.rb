class Patient < ActiveRecord::Base
  has_many :symptoms, dependent: :destroy 
  accepts_nested_attributes_for :symptoms  

  

end
