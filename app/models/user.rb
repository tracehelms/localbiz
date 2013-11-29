class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable,
    :validatable

  has_many :addresses, as: :addressable, dependent: :destroy
  has_many :businesses
  has_many :reviews, class_name: Review, foreign_key: :user_id

  accepts_nested_attributes_for :addresses, allow_destroy: true
end
