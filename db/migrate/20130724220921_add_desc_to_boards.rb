class AddDescToBoards < ActiveRecord::Migration
  def change
  	add_column :boards, :desc, :string
  end
end
