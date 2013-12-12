class ChangeTypeForAccessTokenInFacebookAuths < ActiveRecord::Migration
  def change
    change_column :facebook_auths, :access_token, :string
  end
end
