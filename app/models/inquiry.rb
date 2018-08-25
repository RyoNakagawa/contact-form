# == Schema Information
#
# Table name: inquiries
#
#  id              :integer          not null, primary key
#  inquiry_kind_id :integer
#  name            :string(255)      not null
#  email           :string(255)      not null
#  detail          :text(65535)      not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Inquiry < ActiveRecord::Base
  MAX_LENGTH_NAME = 50.freeze
  VALID_EMAIL_REGEX = /\A[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*\z/
  MAX_LENGTH_DETAIL = 1000.freeze

  belongs_to :inquiry_kind
  validates :inquiry_kind_id, presence: true
  validates :name,
            length: { maximum: MAX_LENGTH_NAME },
            presence: true
  validates :email,
            format: { with: VALID_EMAIL_REGEX },
            presence: true
  validates :detail,
            length: { maximum: MAX_LENGTH_DETAIL },
            presence: true
end
