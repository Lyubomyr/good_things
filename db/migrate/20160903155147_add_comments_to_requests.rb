class AddCommentsToRequests < ActiveRecord::Migration[5.0]
  def change
  	add_column :requests, :comments, :text
  end
end
