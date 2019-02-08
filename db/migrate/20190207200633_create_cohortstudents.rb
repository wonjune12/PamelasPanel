class CreateCohortstudents < ActiveRecord::Migration[5.2]
  def change
    create_table :cohortstudents do |t|
      t.references :student
      t.references :cohort
      t.timestamps
    end
  end
end
