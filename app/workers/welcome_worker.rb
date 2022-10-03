class WelcomeWorker < BaseWorker
    include Sidekiq::Worker
  
    # debugger
    def perform(user)
      # Do something
      UserMailer.welcome_email(user).deliver
    end
  end
  