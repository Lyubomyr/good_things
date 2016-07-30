class CreateAttachments < ActiveRecord::Migration[5.0]
  def change
    create_table :attachments do |t|
      t.attachment :attachment
      t.integer :user_id
      t.integer :attachable_id
      t.string :attachable_type, index: true
      t.string :attachment_type

      t.timestamps
    end
  end
end
