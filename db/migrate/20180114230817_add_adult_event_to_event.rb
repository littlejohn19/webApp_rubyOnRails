class AddAdultEventToEvent < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :adult_event, :boolean
  end
end
