class CreateSpecies < ActiveRecord::Migration[7.2]
  def change
    create_table :species do |t|
      t.string :species_name, null: false

      t.timestamps
    end

    add_index :species, :species_name, unique: true
  end
end
