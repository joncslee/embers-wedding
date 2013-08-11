class AddNotesToGuest < ActiveRecord::Migration
  def change
    add_column :guests, :notes, :text
  end
end
