class Address < ActiveRecord::Base
  belongs_to :addressable, polymorphic: true

  validates_presence_of :city, :state, :zip

  def to_s
    "#{line1} #{city}, #{state} #{zip}"
  end
end
