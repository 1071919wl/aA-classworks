# == Schema Information
#
# Table name: courses
#
#  id            :bigint           not null, primary key
#  name          :string
#  prereq_id     :integer
#  instructor_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Course < ApplicationRecord

belongs_to :enrollment,
primary_key: :id,
foreign_key: :course_id,
class_name: :Enrollment

has_many :enrolled_students,
through: :enrollments,
source: :user

belongs_to :prereq,
primary_key: :id,
foreign_key: :prereq_id,
class_name: :Course,
optional: true

belongs_to :instructor,
foreign_key: :instructor_id,
class_name: :User
end


# SELECT  "courses".* FROM "courses" WHERE "courses"."prereq_id" = $1 LIMIT $2  
# Has_one :prereq,
# primary_key: :id,
# foreign_key: :prereq_id,
# class_name: :Course
# 1) have a course instance, a
# 2) use a.id to find .... whose prereq_id == a.id

# SELECT  "courses".* FROM "courses" WHERE "courses"."id" = $1
# belongs_to :prereq,
# primary_key: :id,
# foreign_key: :prereq_id,
# class_name: :Course
# 1)have a course instance, a 
# 2) a.preq_id
# 3) use a.pred_id to find if there is any instances in table Courses, whose ID = a.preq_id

# Enrollment.first.user.student_id
#   a = enrollment.instance 
#   User Load (0.5ms)  SELECT  "users".* FROM "users" WHERE "users"."id" = $1 LIMIT $2  

# belongs_to :user,
# primary_key: :id,
# foreign_key: :student_id,
# class_name: :User

# belongs to:
# holding foreign_key, looking for a instasnce whose primary_key == my key