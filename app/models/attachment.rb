class Attachment < ApplicationRecord
  has_attached_file :attachment
  do_not_validate_attachment_file_type :attachment

  belongs_to :attachable, polymorphic: true
  belongs_to :owner, class_name: 'User', foreign_key: :user_id
end
