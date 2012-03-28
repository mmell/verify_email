require 'digest/md5'

module VerifyEmail
  class VerifyEmail < ActiveRecord::Base

    ExpiresInSeconds = 2.hours # TODO: enable easy config and dynamic setting

    attr_accessible :email, :continue_to

    validates_presence_of :hash_key
    validates_length_of :hash_key, :within => 32..40 # 40 will accomodate SHA1
    validates_presence_of :email
    validates_format_of :email, :with => /^[^[:space:]@]+@(([[:alnum:]\-_\+\>])+\.)+[[:alpha:]]{2,6}$/

    scope :unverified, where("verified = 1")
    scope :expired, where("NOW() > verify_emails.expires")
    scope :not_expired, where("NOW() < verify_emails.expires")

    before_validation(:on => :create) do
      self.hash_key = VerifyEmail.hash_key
      self.expires = ExpiresInSeconds.from_now
    end

    def self.hash_key
      t = Time.new
      Digest::MD5.hexdigest( t.to_i.to_s + rand(t.to_i).to_s )
    end

    def self.confirm(email)
      VerifyEmail.update_all("verified=1", "email='#{email}'")
    end

  end
end
