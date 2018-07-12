class ChangePeopleFkOnMatchesToCascade < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :matches, :people
    add_foreign_key :matches, :people, on_delete: :cascade
  end
end
