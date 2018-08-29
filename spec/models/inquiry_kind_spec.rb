# == Schema Information
#
# Table name: inquiry_kinds
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe InquiryKind, type: :model do
  describe 'validation' do
    context 'success' do
      it 'valid params' do
        inquiry_kind = build(:inquiry_kind, name: Faker::Lorem.characters(InquiryKind::MAX_LENGTH_NAME))
        aggregate_failures do
          expect(inquiry_kind).to be_valid
          expect{ inquiry_kind.save }.to change{ InquiryKind.count }.by(1)
        end
      end
    end

    context 'fail' do
      it 'name is nill' do
        inquiry_kind = build(:inquiry_kind)
        aggregate_failures do
          expect(inquiry_kind).to be_invalid
          expect{ inquiry_kind.save }.to change{ InquiryKind.count }.by(0)
        end
      end

      it 'name is too long' do
        inquiry_kind = build(:inquiry_kind, name: Faker::String.random(InquiryKind::MAX_LENGTH_NAME + 1))
        aggregate_failures do
          expect(inquiry_kind).to be_invalid
          expect{ inquiry_kind.save }.to change{ InquiryKind.count }.by(0)
        end
      end
    end
  end
end
