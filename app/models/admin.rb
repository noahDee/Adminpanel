class Admin < ApplicationRecord
  has_secure_password
  validates :first_name, :last_name,  presence: true
  validates :email, presence: true
end
