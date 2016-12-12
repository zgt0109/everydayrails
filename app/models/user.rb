# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string(255)
#  password_digest :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#  admin           :boolean
#

class User < ActiveRecord::Base
  has_secure_password

  validates :email, presence: true, uniqueness: true
end
