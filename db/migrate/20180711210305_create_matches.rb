class CreateMatches < ActiveRecord::Migration[5.2]
  def change
    create_table :matches do |t|
      t.references :person, foreign_key: true, null: false
      t.references :superhero, foreign_key: true, null: false
      t.boolean :person_won

      t.timestamps
    end
  end
end
