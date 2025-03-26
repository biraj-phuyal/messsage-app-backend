class CreateChats < ActiveRecord::Migration[8.0]
  def up
    create_table :chats, if_not_exists: true do |t|
      t.string :name

      t.timestamps
    end
  end

  def drop
    drop_table :chats
  end
end
