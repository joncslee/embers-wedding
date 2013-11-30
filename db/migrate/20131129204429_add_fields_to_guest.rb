class AddFieldsToGuest < ActiveRecord::Migration
  def change
    add_column :guests, :invitation_id, :integer
    add_column :guests, :confirmation, :boolean
    add_column :guests, :dietary_restrictions, :text
  end
end
