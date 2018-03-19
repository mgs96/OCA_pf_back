class Advisory < ApplicationRecord
  has_many :attendances
  # has_many :students, through: :attendances, source: :user
  # has_many :psychologist, through: :attendances, source: :user
end
