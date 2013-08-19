class AddNotComingToGuest < ActiveRecord::Migration
  def change
    add_column :guests, :not_coming, :boolean
  end
end
