class AddRoundToMatch < ActiveRecord::Migration[5.2]
  def change
    add_reference :matches, :round, foreign_key: true, null: false
  end
end
