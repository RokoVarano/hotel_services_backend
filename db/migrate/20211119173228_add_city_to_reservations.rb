class AddCityToReservations < ActiveRecord::Migration[6.1]
  def change
    add_column :reservations, :city, :string
  end
end
