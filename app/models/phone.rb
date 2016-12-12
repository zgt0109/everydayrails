# == Schema Information
#
# Table name: phones
#
#  id         :integer          not null, primary key
#  contact_id :integer
#  phone      :string(255)
#  phone_type :string(255)
#  created_at :datetime
#  updated_at :datetime
#
# Indexes
#
#  index_phones_on_contact_id  (contact_id)
#

class Phone < ActiveRecord::Base
  belongs_to :contact

  validates :phone, uniqueness: { scope: :contact_id }
end
