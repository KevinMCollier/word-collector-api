class User < ApplicationRecord
  acts_as_token_authenticatable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :flashcards

  def as_json(options = {})
    super(options).merge({ auth_token: authentication_token })
  end
end
