# This migration comes from verify_email (originally 20120326173810)
class CreateVerifyEmailVerifyEmails < ActiveRecord::Migration
  def change
    create_table :verify_email_verify_emails do |t|
      t.string :hash_key
      t.string :email
      t.datetime :expires
      t.boolean :verified, :default => false
      t.string :continue_to

      t.timestamps
    end
  end
end
