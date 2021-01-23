class User::ContactsController < ApplicationController
  before_action :authenticate_user!
  
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      ContactMailer.contact_mail(@contact).deliver
      flash[:success] = 'お問い合わせ頂きありがとうございます!'
      redirect_to user_user_path(current_user)
    else
      render :new
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :message, :email, :title)
  end
end
