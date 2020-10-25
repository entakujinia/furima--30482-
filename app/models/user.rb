class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :email,             format: { with: /@/ }
  validates :password,          length: { minimum: 6 }, confirmation: true, format: { with: /\A[a-zA-Z0-9]+\z/ }
  NAME_REGEX = /\A[ぁ-んァ-ン一-龥]+\z/.freeze
  NAME_KANA = /\A[ァ-ヶー－]+\z/.freeze
  with_options presence: true do
    validates :nickname
    validates :first_name,       format: { with: NAME_REGEX }
    validates :last_name,        format: { with: NAME_REGEX }
    validates :first_name_kana,  format: { with: NAME_KANA }
    validates :last_name_kana,   format: { with: NAME_KANA }
    validates :birthday

  #has_many :items
  #has_many :purchases
  end
end
