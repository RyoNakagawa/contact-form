class InquiryController < ApplicationController
  before_action :set_new_inquiry, only: [:confirm, :create]
  before_action :set_inquiry_kind, only: [:confirm, :create]

  def new
    @inquiry = Inquiry.new
    @inquiry_kinds = InquiryKind.pluck(:name, :id)
  end

  def confirm
  end

  def create
   if @inquiry.save
     redirect_to inquiry_complete_path
   else
     redirect_to root_path
   end
  end

  def complete
  end

  private

  def inquiry_params
    params.require(:inquiry)
          .permit(:inquiry_kind_id, :name, :email, :detail)
  end

  def set_new_inquiry
    @inquiry = Inquiry.new(inquiry_params)    
    redirect_to root_path unless @inquiry.valid?
  end

  def set_inquiry_kind
    @inquiry_kind = InquiryKind.find_by_id(@inquiry.inquiry_kind_id)
    redirect_to root_path if @inquiry_kind.nil?
  end
end
