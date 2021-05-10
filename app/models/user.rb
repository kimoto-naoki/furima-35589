class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, :last_name, :first_name, :ruby_last_name, :ruby_first_name, :birthday, presence: true
   
  validates :last_name, :first_name, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/}  
  validates :ruby_last_name, :ruby_first_name, format: {with: /\A[ァ-ヶー－]+\z/}
  validates :password,  format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i}

  has_many :items
end
