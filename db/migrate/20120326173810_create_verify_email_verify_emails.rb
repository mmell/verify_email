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
