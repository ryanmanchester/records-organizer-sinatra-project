class AddImageUrlToRecords < ActiveRecord::Migration[5.2]
  def change
    add_column :records, :image_url, :string
  end
end
