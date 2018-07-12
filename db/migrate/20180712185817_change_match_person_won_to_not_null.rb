class ChangeMatchPersonWonToNotNull < ActiveRecord::Migration[5.2]
  def change
    change_column_null :matches, :person_won, false
  end
end
