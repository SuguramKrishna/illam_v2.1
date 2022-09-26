class Contact < MailForm::Base
    attribute :name,      :validate => true
    attribute :email,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
    attribute :message
  
    # Declare the e-mail headers. It accepts anything the mail method
    # in ActionMailer accepts.
    def headers
      {
        :subject => "Hey Team, we have an message !!",
        :to => "illamhelpdesk@gmail.com",
        :from => %("#{name}" <#{email}>)
      }
    end
  end