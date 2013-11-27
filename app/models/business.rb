class Business < ActiveRecord::Base
  belongs_to :user
  has_many :addresses, as: :addressable, dependent: :destroy
  has_many :reviews, as: :reviewable, dependent: :destroy

  accepts_nested_attributes_for :addresses, allow_destroy: true
  validates_presence_of :category, :name
end
