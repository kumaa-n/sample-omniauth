class ReferenceUserAuthentications < ActiveRecord::Migration[8.1]
  def change
    add_reference :authentications, :user, null: false, foreign_key: true
  end
end
