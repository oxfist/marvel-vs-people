class ChangePersonColumnsToNotNull < ActiveRecord::Migration[5.2]
  def change
    change_column_null :people, :name, false
    change_column_null :people, :occupation, false
    change_column_null :people, :special_ability, false
    change_column_null :people, :quote, false
  end
end
