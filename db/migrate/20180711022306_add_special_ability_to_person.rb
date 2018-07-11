class AddSpecialAbilityToPerson < ActiveRecord::Migration[5.2]
  def change
    add_column :people, :special_ability, :string
  end
end
