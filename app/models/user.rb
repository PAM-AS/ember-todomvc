class User < ActiveRecord::Base
  # has_secure_password
  has_many :api_keys
  has_many :todos, dependent: :destroy
  has_many :facebook_auths, dependent: :destroy

  validates :email, uniqueness: true
  validates :name, presence: true

  def session_api_key
    api_keys.active.session.first_or_create
  end
end
