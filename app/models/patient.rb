class Patient < ActiveRecord::Base
  has_many :symptoms, dependent: :destroy 

end
