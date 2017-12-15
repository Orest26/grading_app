class CreateStudents < ActiveRecord::Migration
  def change
    create_table 'students' do |student|
      student.string 'name'
      student.string 'surname'
     student.string 'email'
      student.string  'password'
      # Add fields that let Rails automatically keep track
      # of when movies are added or modified:
      student.timestamps
    end
  end
end