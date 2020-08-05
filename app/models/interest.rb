class Interest < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3 }
  
  belongs_to :student
end
