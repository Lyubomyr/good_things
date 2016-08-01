class User < ApplicationRecord
  include UserRoles
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100#" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  has_and_belongs_to_many :organizations
  has_many :requests

  has_many :attachments, as: :attachable, dependent: :destroy
  has_many :owned_attachments, class_name: 'Attachment', foreign_key: :user_id

end