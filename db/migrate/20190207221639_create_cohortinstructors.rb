class CreateCohortinstructors < ActiveRecord::Migration[5.2]
  def change
    create_table :cohortinstructors do |t|
      t.references :cohort
      t.references :instructor
      t.timestamps
    end
  end
end
