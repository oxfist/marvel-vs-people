class CreateRounds < ActiveRecord::Migration[5.2]
  def change
    create_table :rounds do |t|

      t.timestamps
    end
  end
end
