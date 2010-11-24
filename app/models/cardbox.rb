class Cardbox < ActiveRecord::Base
  belongs_to :user

  def is_deletable?
    true
  end
end
