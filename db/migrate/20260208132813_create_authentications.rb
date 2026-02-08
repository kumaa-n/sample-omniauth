class CreateAuthentications < ActiveRecord::Migration[8.1]
  def change
    create_table :authentications do |t|
      t.string :provider, null: false
      t.string :uid, null: false
      t.string :name, null: false

      t.timestamps
    end
  end
end
