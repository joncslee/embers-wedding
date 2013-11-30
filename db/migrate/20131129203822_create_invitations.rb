class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.string :token
      t.text :comments
      t.boolean :hotel

      t.timestamps
    end
  end
end
