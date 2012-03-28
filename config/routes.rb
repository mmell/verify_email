VerifyEmail::Engine.routes.draw do
  root to: 'verify_emails#index'

  resources :verify_emails, :except => [:edit, :destroy]

  get '/verify_emails/verify/:hash_key', action: :verify, constraints: { hash_key: /[a-zA-Z0-9]{32,40}/ }, :as => :verify_verify_email
  get '/verify_emails/verified/:hash_key', action: :verified, constraints: { hash_key: /[a-zA-Z0-9]{32,40}/ }, :as => :verified_verify_email

end
