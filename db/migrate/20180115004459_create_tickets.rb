class CreateTickets < ActiveRecord::Migration[5.1]
  def change
    create_table :tickets do |t|
      t.integer :user_id
      t.integer :event_id
      t.string :name
      t.text :address
      t.decimal :price
      t.string :email_address

      t.timestamps
    end
  end
end
