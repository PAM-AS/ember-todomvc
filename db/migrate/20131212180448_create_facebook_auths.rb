class CreateFacebookAuths < ActiveRecord::Migration
  def change
    create_table :facebook_auths do |t|
      t.integer :account_id
      t.integer :access_token
      t.datetime :created_at
      t.datetime :expired_at
      t.references :user, index: true
    end
  end
end
