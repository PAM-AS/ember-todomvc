class ChangeColumnAccessTokenOnApiKey < ActiveRecord::Migration
  def change
    change_column :api_keys, :access_token, :string, unique: true
  end
end
