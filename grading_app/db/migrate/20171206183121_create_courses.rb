class CreateCourses < ActiveRecord::Migration
  def change
    create_table 'courses' do |course|
      course.string 'code'
      course.string 'name'
      course.string 'semester_offered'
      course.text 'catalog_data'
      course.references  'instructor'
      # Add fields that let Rails automatically keep track
      # of when movies are added or modified:
      course.timestamps
    end
  end
end