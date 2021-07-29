class CreateNationalParksTable < ActiveRecord::Migration[5.2]
  def change
    create_table :national_parks do |t|
      t.string :name
    end
  end
end
