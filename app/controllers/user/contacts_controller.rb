class User::ContactsController < ApplicationController

  def new
    @contact = Contact.new
  end

  def create
    contact = Contact.new(contact_params)
    if contact.save
      ContactMailer.contact_mail(contact).deliver
    end
    redirect_to new_user_contact_path
  end

  private
  def contact_params
    params.require(:contact).permit(:name, :message)
  end

end
