class RenameSuperherosToSuperheroes < ActiveRecord::Migration[5.2]
  def change
    rename_table :superheros, :superheroes
  end
end
