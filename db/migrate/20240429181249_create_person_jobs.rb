class CreatePersonJobs < ActiveRecord::Migration[7.2]
  def change
    create_table :person_jobs do |t|
      t.date :start_date, null: false
      t.date :end_date
       t.references :person, null: false, foreign_key: { to_table: :characters }, index: true
       t.references :job, null: false, foreign_key: true, index: true

       t.timestamps
     end

     add_index :person_jobs, %i[person_id job_id start_date], unique: true
  end
end
