class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :title
      t.string :image
      t.text :description
      t.timestamp :date
      t.string :slug

      t.timestamps
    end
    add_index :events, :slug, unique: true
  end
end
