class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users, if_not_exists: true do |t|
      t.string :name
      t.string :phone
      t.string :password_digest

      t.timestamps
    end
  end

  def drop
    drop_table :users
  end
end
