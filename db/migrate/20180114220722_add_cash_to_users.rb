class AddCashToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :money_state, :decimal, :precision => 8, :scale => 2, default: 0
  end
end
