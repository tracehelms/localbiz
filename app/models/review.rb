class Review < ActiveRecord::Base
  belongs_to :reviewable, polymorphic: true
  belongs_to :user

  validates :content, presence: true
  validates :rating, inclusion: {in: 0..10}
end
