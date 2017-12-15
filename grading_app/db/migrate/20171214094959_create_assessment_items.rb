class CreateAssessmentItems< ActiveRecord::Migration
  def change
    drop_table :assessmentitems
    create_table :assessmentitems do |t|
      t.string 'name'
      t.string 'weight'
      t.references  'course'
      # Add fields that let Rails automatically keep track
      # of when movies are added or modified:
      t.timestamps
    end
  end
end