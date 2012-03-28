Rails.application.routes.draw do

  mount VerifyEmail::Engine => "/emails", :as => :emails
end
