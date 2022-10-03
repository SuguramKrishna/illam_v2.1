class ContactsController < ApplicationController

  skip_before_action :ensure_user_logged_in
  def new
    @contact = Contact.new
  end

  def create
  
    @contact = Contact.new(contact_params)
    if @contact.save
       @contact.request = request
       if @contact.deliver
         redirect_to root_path
         flash.now[:notice] = 'Thank you for your message. We will contact you soon!'
       else
         flash.now[:error] = 'Cannot send message.'
         render :new
       end
    else
       render :new
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name,:email,:message)
  end

end