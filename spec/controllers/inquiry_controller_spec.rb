require 'rails_helper'

RSpec.describe InquiryController, type: :controller do
  let (:inquiry_kind) {
    create(:inquiry_kind, name: Faker::Lorem.characters(InquiryKind::MAX_LENGTH_NAME))
  }

  let (:inquiry_params) {
    {
      inquiry_kind_id: inquiry_kind.id,
      name: Faker::Lorem.characters(Inquiry::MAX_LENGTH_NAME),
      email: Faker::Internet.email,
      detail: Faker::Lorem.characters(Inquiry::MAX_LENGTH_DETAIL)
    } 
  }

  invalid_params = [
    {key: :inquiry_kind_id, value: nil, reason: 'nil'},
    {key: :inquiry_kind_id, value: 10, reason: 'not found'},
    {key: :name, value: nil, reason: 'nil'},
    {key: :name, value: Faker::String.random(Inquiry::MAX_LENGTH_NAME + 1), reason: 'too long'},
    {key: :email, value: nil, reason: 'nil'},
    {key: :email, value: 'aaaaaa', reason: 'invalid format'},
    {key: :detail, value: nil, reason: 'nil'},
    {key: :detail, value: Faker::String.random(Inquiry::MAX_LENGTH_DETAIL + 1), reason: 'too long'},
  ]
 
  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #confirm" do
    context "When inquiry params is valid" do
      subject {
        post :confirm, inquiry: inquiry_params
      }

      it "render template :confirm" do
        expect( subject ).to render_template :confirm
      end
    end

    context "When inquiry params is invalid" do
      invalid_params.each do |invalid_param|
        it "#{invalid_param[:key]} is #{invalid_param[:reason]}" do
          params = inquiry_params
          params[invalid_param[:key]] = invalid_param[:value]

          post :confirm, inquiry: params
          expect(response).to redirect_to root_path
        end
      end
    end
  end

  describe "POST #create" do
    context "When inquiry params is valid" do
      subject {
        post :create, inquiry: inquiry_params
      }

      it "redirect to complete path" do
        expect( subject ).to redirect_to inquiry_complete_path
      end

      it "inquiry insert record" do
        expect{ subject }.to change{ Inquiry.count }.by(1)
      end
    end

    context "When inquiry params is invalid" do
      invalid_params.each do |invalid_param|
        it "#{invalid_param[:key]} is #{invalid_param[:reason]}" do
          params = inquiry_params
          params[invalid_param[:key]] = invalid_param[:value]

          post :create, inquiry: params
          expect(response).to redirect_to root_path
        end
      end
    end
  end

  describe "GET #complete" do
    it "returns http success" do
      get :complete
      expect(response).to have_http_status(:success)
    end
  end

end
