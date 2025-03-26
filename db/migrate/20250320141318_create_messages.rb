class CreateMessages < ActiveRecord::Migration[8.0]
  def up
    create_table :messages, if_not_exists: true do |t|
      t.references :user, null: false, foreign_key: true
      t.references :chat, null: false, foreign_key: true
      t.text :content

      t.timestamps
    end
  end

  def drop
    drop_table :messages
  end
end
