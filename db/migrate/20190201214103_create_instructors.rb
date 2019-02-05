class CreateInstructors < ActiveRecord::Migration[5.2]
  def change
    create_table :instructors do |t|
      t.string :firstname
      t.string :lastname
      t.integer :age
      t.string :degree
      t.integer :salary
      t.string :email
      t.references :cohort
      t.timestamps
    end
  end
end
