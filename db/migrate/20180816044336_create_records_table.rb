class CreateRecordsTable < ActiveRecord::Migration[5.0]
  def change
    create_table :records do |t|
      t.string :name
      t.string :artist
      t.integer :user_id
    end
  end
end
