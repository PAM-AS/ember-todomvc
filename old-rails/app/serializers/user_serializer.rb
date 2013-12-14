class UserSerializer < ActiveModel::Serializer
  embed :ids, include: true
  attributes :id, :name, :username, :email, :access_token, :user_id

  has_many :todos

  def access_token
    object.session_api_key.access_token
  end

  def user_id
    object.session_api_key.user_id
  end
end
