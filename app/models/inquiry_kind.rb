# == Schema Information
#
# Table name: inquiry_kinds
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class InquiryKind < ActiveRecord::Base
  MAX_LENGTH_NAME = 100.freeze

  has_many :inquiries
  validates :name,
            length: { maximum: MAX_LENGTH_NAME },
            presence: true
end
