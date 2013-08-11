class AddAddressFieldsToGuest < ActiveRecord::Migration
  def change
    add_column :guests, :address1, :string
    add_column :guests, :address2, :string
    add_column :guests, :city, :string
    add_column :guests, :state, :string
    add_column :guests, :zipcode, :string
    add_column :guests, :country, :string
  end
end
