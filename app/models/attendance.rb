class Attendance < ApplicationRecord
  belongs_to :student, class_name: 'User'
  belongs_to :psychologist, class_name: 'User'
  belongs_to :advisory
end
