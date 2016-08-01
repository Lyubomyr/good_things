class CreateOrganizations < ActiveRecord::Migration[5.0]
  def change
    create_table :organizations do |t|
      t.string :name
      t.text :description
      t.string :address
      t.text :contacts

      t.timestamps
    end

    create_join_table :users, :organizations
  end
end
