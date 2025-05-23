class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #ここからアソシエーション
  has_many :prototypes
  has_many :comments

  #ここからバリデーション
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: "の形式が正しくありません" }
  validates :name, presence: true
  validates :profile, presence: true
  validates :occupation, presence: true
  validates :position, presence: true
end
