class AddColAmountToBookings < ActiveRecord::Migration

  def change
     add_column :bookings, :amount, :float
  end

end
