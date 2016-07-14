class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.text :about_myself
      t.string :country
      t.string :city
      t.string :address

      t.timestamps
    end
  end
end
