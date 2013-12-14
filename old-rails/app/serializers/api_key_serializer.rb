class ApiKeySerializer < ActiveModel::Serializer
  attributes :access_token, :user_id

  def user_id
    object.user.id
  end
end
