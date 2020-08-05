class Course < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3 }

  belongs_to :instructor
  has_many :students
end