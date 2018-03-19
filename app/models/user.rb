class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :rememberable, :trackable, :validatable
  include DeviseTokenAuth::Concerns::User

  has_many :student_attendances, class_name: 'Attendance', foreign_key: 'student_id'
  has_many :psychologist_attendances, class_name: 'Attendance', foreign_key: 'psychologist_id'
end
