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

require 'rails_helper'

RSpec.describe Inquiry, type: :model do
  let (:inquiry_kind) {
    create(:inquiry_kind, name: Faker::Lorem.characters(InquiryKind::MAX_LENGTH_NAME))
  }

  let (:valid_params) {
    {
      inquiry_kind: inquiry_kind,
      name: Faker::Lorem.characters(Inquiry::MAX_LENGTH_NAME),
      email: Faker::Internet.email,
      detail: Faker::Lorem.characters(Inquiry::MAX_LENGTH_DETAIL)
    }
  }

  describe 'validation' do
    context 'success' do
      it 'valid params' do
        inquiry = build(:inquiry, valid_params)
        aggregate_failures do
          expect(inquiry).to be_valid
          expect{ inquiry.save }.to change{ Inquiry.count }.by(1)
        end
      end
    end

    context 'fail' do
      invalid_params = [
        {key: :inquiry_kind, value: nil, reason: 'nil'},
        {key: :name, value: nil, reason: 'nil'},
        {key: :name, value: Faker::String.random(Inquiry::MAX_LENGTH_NAME + 1), reason: 'too long'},
        {key: :email, value: nil, reason: 'nil'},
        {key: :email, value: 'aaaaaa', reason: 'invalid format'},
        {key: :detail, value: nil, reason: 'nil'},
        {key: :detail, value: Faker::String.random(Inquiry::MAX_LENGTH_DETAIL + 1), reason: 'too long'},
      ]

      invalid_params.each do |invalid_param|
        it "#{invalid_param[:key]} is #{invalid_param[:reason]}" do
          params = valid_params
          params[invalid_param[:key]] = invalid_param[:value]
          inquiry = build(:inquiry, params)
          aggregate_failures do
            expect(inquiry).to be_invalid
            expect{ inquiry.save }.to change{ Inquiry.count }.by(0)
          end
        end
      end
    end

  end
end
