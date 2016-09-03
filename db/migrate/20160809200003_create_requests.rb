class CreateRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :requests do |t|
      t.integer :request_type
      t.string :title
      t.text :text
      t.integer :status
      t.integer :user_id

      t.timestamps
    end
  end
end
