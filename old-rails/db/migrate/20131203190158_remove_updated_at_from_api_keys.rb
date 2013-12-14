class RemoveUpdatedAtFromApiKeys < ActiveRecord::Migration
  def change
    remove_column :api_keys, :updated_at, :string
  end
end
