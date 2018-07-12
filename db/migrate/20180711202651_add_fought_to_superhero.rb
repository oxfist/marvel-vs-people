class AddFoughtToSuperhero < ActiveRecord::Migration[5.2]
  def change
    add_column :superheroes, :fought, :boolean, default: false, null: false
  end
end
