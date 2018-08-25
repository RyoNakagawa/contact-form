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

FactoryBot.define do
  factory :inquiry do
  end
end
