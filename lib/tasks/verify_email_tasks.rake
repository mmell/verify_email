desc "Explaining what the task does"
namespace :verify_email do

  desc "Delete unverified emails that have expired."
  task :delete_expired => [:environment] do
    VerifyEmail.unverified.expired.delete_all
  end

  desc "Delete even verified emails one day after expiration."
  task :delete_confirmed => [:environment] do
    VerifyEmail.where("'#{1.day.ago + ::VerifyEmail::VerifyEmail::ExpiresInSeconds}' > verify_emails.expires").delete_all
  end

end
