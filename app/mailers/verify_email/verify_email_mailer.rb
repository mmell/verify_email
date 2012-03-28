module VerifyEmail
  class VerifyEmailMailer < ActionMailer::Base
#    default from: "from@example.com"

    def generic( recipients, opts )
      # Email header info MUST be added here
      @recipients = recipients

      @from ||= opts[:from]
      @subject ||= opts[:subject]

      # set instance variables for body content
      opts.each { |k, v| instance_variable_set("@#{k}".to_sym, v) }
      mail(to: @recipients, subject: @subject, from: @from)
    end

    # Subject can be set in your I18n file at config/locales/en.yml
    # with the following lookup:
    #
    #   en.verify_email_mailer.verify_email.subject
    #
    def verify_email( recipients, opts )
      @subject ||= "Email Verification"
      generic( recipients, opts )
    end

  end
end
