class AddPlacesToEvent < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :places, :string
  end
end
