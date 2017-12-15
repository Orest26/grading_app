class CreateInstructors < ActiveRecord::Migration
  def change
    create_table 'instructors' do |instructor|
      instructor.string 'name'
      instructor.string 'surname'
      instructor.string 'email'
      instructor.string  'password'
      # Add fields that let Rails automatically keep track
      # of when movies are added or modified:
      instructor.timestamps
    end
  end
end
