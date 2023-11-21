class CreateGames < ActiveRecord::Migration[7.1]
  def change
    create_table :games do |t|
      t.string :name
      t.text :description
      t.integer :price
      t.string :player_number
      t.string :games_duration
      t.boolean :availability, default: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
