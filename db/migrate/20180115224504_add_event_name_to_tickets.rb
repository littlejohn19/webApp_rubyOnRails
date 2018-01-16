class AddEventNameToTickets < ActiveRecord::Migration[5.1]
  def change
    add_column :tickets, :event_name, :string
  end
end
