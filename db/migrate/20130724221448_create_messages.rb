class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :owner
      t.string :content

      t.timestamps
    end
  end
end
