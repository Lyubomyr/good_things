class User < ApplicationRecord
  include UserRoles
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_and_belongs_to_many :organizations
  has_many :requests

  has_one :avatar, -> { where "attachment_type = avatar" }, as: :attachable, dependent: :destroy
  has_many :documents, -> { where "attachment_type = document" }, as: :attachable, dependent: :destroy
  has_many :owned_attachments, class_name: 'Attachment', foreign_key: :user_id

end