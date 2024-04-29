class CreateCompanies < ActiveRecord::Migration[7.2]
  def change
    create_table :companies do |t|
      t.string :company_name, null: false

      t.timestamps
    end

    add_index :companies, :company_name, unique: true
  end
end
