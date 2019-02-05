class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.string :firstname
      t.string :lastname
      t.integer :age
      t.string :degree
      t.string :email
      t.references :cohort
      t.timestamps
    end
  end
end
