class AddBoardToMessage < ActiveRecord::Migration
  def change
  	add_column :messages, :board, :string

  end
end
