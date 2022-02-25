class CreateMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :movies do |t|
      t.string :image
      t.string :title
      t.date :creationdate
      t.integer :qualification
      t.references :genre, null: false, foreign_key: true

      t.timestamps
    end
  end
end
