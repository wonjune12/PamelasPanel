class CreateCohortinstructors < ActiveRecord::Migration[5.2]
  def change
    create_table :cohortinstructors do |t|
      t.references :cohort, foreign_key: true
      t.references :instructor, foreign_key: true
      t.timestamps
    end
  end
end
