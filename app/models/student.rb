class Student < ApplicationRecord
  validates :firstname, presence: true, length: { minimum: 3 }
  validates :lastname, presence: true, length: { minimum: 3 }
  validates :gender, presence: true, length: { minimum: 4 }
  validates :email, presence: true, length: { minimum: 4 }
  validates :age, presence: true, length: { maximum: 3 }
  validates :phonenumber, presence: true, length: { minimum: 8 }

  belongs_to :course
  has_many :interests
  
  has_and_belongs_to_many :instructors
end