class AddReferencesToReservations < ActiveRecord::Migration[6.1]
  def change
    add_reference :reservations, :user, null: false, foreign_key: true
    add_reference :reservations, :service, null: false, foreign_key: true
  end
end
