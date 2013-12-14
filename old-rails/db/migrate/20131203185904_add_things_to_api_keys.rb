class AddThingsToApiKeys < ActiveRecord::Migration
  def change
    add_reference :api_keys, :user, index: true
    add_column :api_keys, :scope, :string
    add_column :api_keys, :expired_at, :datetime
  end
end
