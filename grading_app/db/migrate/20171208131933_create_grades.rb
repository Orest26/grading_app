class CreateGrades< ActiveRecord::Migration
  def change
    create_table 'grades' do |t|
      t.string 'grade'
      t.references  'assessmentitem'
      t.references  'student'
      # Add fields that let Rails automatically keep track
      # of when movies are added or modified:
      t.timestamps
    end
  end
end