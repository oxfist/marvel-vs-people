class CreateSuperheros < ActiveRecord::Migration[5.2]
  def change
    create_table :superheros do |t|
      t.string :name, null: false
      t.integer :character_id, null: false

      t.timestamps
    end
  end
end
