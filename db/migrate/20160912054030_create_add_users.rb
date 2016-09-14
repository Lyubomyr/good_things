class CreateAddUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :add_users do |t|

      t.timestamps
    end
  end
end
