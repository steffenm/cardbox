class Card < ActiveRecord::Base
  belongs_to :user
  has_many :card_cardboxes
  has_machine_tags

  cattr_reader :per_page
  @@per_page = 20


  def is_editable?
    true
  end
  def is_deletable?
    is_editable?
  end
end
