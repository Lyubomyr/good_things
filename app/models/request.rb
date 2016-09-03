class Request < ApplicationRecord
  belongs_to :requestor, class_name: 'User', foreign_key: :user_id
  has_many :attachments, as: :attachable, dependent: :destroy
  attr_accessor :attachment

  enum request_type: [:giver, :taker], status: [:active, :completed]
end
