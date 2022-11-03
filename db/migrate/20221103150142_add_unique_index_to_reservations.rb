class AddUniqueIndexToReservations < ActiveRecord::Migration[7.0]
  def change
    add_index :reservations, [:property_id, :user_id, :reservation_date], unique: true, name: "idx_reserve_on_property_id_and_user_id_and_reserve_date"
    # so that a user cannot make
    # reservation to the same property on the same date more than once
  end
end
