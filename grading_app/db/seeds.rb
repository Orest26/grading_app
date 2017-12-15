# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# more_instructors = [
    
#     {:name => 'Elton', :surname => 'Ballhysa',
#     :email => 'elton@yahoo.com', :password => 'Elton456'},
#  ]

# more_instructors.each do |instructor|
#  Instructor.create!(instructor)
# end

# more_students = [
    
#     {:name => 'Orest', :surname => 'Hasa',
#     :email => 'ohasa@live.com', :password => 'Orest123'},
#  ]

# more_students.each do |student|
#  Student.create!(student)
# end

more_courses = [
  {:code=> 'CS107', :name => 'Computer Architecture',
   :semester_offered => '2nd', :catalog_data => 'comp architecture ', :instructor_id => '1'},
   {:code=> 'CS108', :name => 'Data Structures',
   :semester_offered => '1st', :catalog_data => 'Structures ', :instructor_id => '1'}
  ]

more_courses.each do |course|
  Course.create!(course)
end