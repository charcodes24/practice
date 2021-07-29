class AddColumnToNationalParksTable < ActiveRecord::Migration[5.2]
  def change
    add_column :national_parks, :image_url, :string
  end
end
