class RenamingAColomn < ActiveRecord::Migration[8.0]
  def change
    add_reference :messages, :recipient, null: true, foreign_key: { to_table: :users }
    Message.all.each do |message|
      message.recipient_id = message.reciepient_id
      message.save!
    end
    change_column_null :messages, :recipient_id, false
    remove_reference :messages, :reciepient, null: false, foreign_key: { to_table: :users }
  end
end
