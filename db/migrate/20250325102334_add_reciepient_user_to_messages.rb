class AddReciepientUserToMessages < ActiveRecord::Migration[8.0]
  def up
    add_reference :messages, :reciepient, null: false, foreign_key: { to_table: :users }
  end

  def down
    remove_reference :messages, :reciepient, null: false, foreign_key: { to_table: :users }
  end
end
