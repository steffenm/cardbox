class Cardbox < ActiveRecord::Base
  belongs_to :user
  has_many :card_cardboxes

  def is_deletable?
    true
  end
end
