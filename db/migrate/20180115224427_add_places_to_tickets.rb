class AddPlacesToTickets < ActiveRecord::Migration[5.1]
  def change
    add_column :tickets, :places, :string
  end
end
