class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string :name, null: false
      t.string :track_type, null: false
      t.integer :album_id

      t.timestamps null: false
    end
    add_index :tracks, [:album_id, :name], unique: true
    add_index :tracks, :track_type
  end
end
