class AddColIsVerified < ActiveRecord::Migration
  def change
  	add_column :rooms, :is_verified, :boolean, :default => false
  end
end
