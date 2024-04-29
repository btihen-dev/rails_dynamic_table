class CreateCharacters < ActiveRecord::Migration[7.2]
  def change
    create_table :characters do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :nick_name
      t.string :given_name
      t.string :gender, null: false
      t.references :species, null: false, foreign_key: true, index: true

      t.timestamps
    end

    add_index :characters, %i[first_name last_name gender],
              unique: true
  end
end
