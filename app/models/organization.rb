class Organization < ApplicationRecord
  has_and_belongs_to_many :users
  has_many :attachments, as: :attachable, dependent: :destroy
  accepts_nested_attributes_for :attachments
  attr_accessor :attachment
end
