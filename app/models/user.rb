class User < ApplicationRecord
  has_many :organizations
  has_many :requests
end
