class CreateCohorts < ActiveRecord::Migration[5.2]
  def change
    create_table :cohorts do |t|
      t.string :title
      t.string :start_date
      t.string :end_date
      t.references :course
      t.timestamps
    end
  end
end
