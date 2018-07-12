class AddDefeatedToPerson < ActiveRecord::Migration[5.2]
  def change
    add_column :people, :defeated, :boolean, default: false, null: false
  end
end
