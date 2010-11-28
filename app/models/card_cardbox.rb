class CardCardbox < ActiveRecord::Base
  include ActiveRecord::Transitions

  has_one :card
  has_one :cardbox

  validates_associated :card
  validates_associated :cardbox
  validate :cardbox_belongs_to_current_user

  SPACING = [1,2,5,9,14]

  scope :added,   :conditions=>{:state => :added}
  scope :level_1, :conditions=>{:state => :level_1}
  scope :level_2, :conditions=>{:state => :level_2}
  scope :level_3, :conditions=>{:state => :level_3}
  scope :level_4, :conditions=>{:state => :level_4}
  scope :level_5, :conditions=>{:state => :level_5}
  scope :learned, :conditions=>{:state => :learned}

  scope :next_card, where("
    state='added' OR
    (state='level_1' AND DATEDIFF(NOW(),status_at) >= #{SPACING[0]}) OR
    (state='level_2' AND DATEDIFF(NOW(),status_at) >= #{SPACING[1]}) OR
    (state='level_3' AND DATEDIFF(NOW(),status_at) >= #{SPACING[2]}) OR
    (state='level_4' AND DATEDIFF(NOW(),status_at) >= #{SPACING[3]}) OR
    (state='level_5' AND DATEDIFF(NOW(),status_at) >= #{SPACING[4]})
  ").order("created_at DESC").limit(1)

  state_machine do
    state :added
    state :level_1
    state :level_2
    state :level_3
    state :level_4
    state :level_5
    state :learned

    event :correct_answer do
      transitions :from => :added,   :to => :level_1, :on_transition => :add_status_date
      transitions :from => :level_1, :to => :level_2, :on_transition => :add_status_date
      transitions :from => :level_2, :to => :level_3, :on_transition => :add_status_date
      transitions :from => :level_3, :to => :level_4, :on_transition => :add_status_date
      transitions :from => :level_4, :to => :level_5, :on_transition => :add_status_date
      transitions :from => :level_5, :to => :learned, :on_transition => :add_status_date
    end

    event :wrong_answer do
      transitions :from => :added,   :to => :added,   :on_transition => :add_status_date
      transitions :from => :level_1, :to => :level_1, :on_transition => :add_status_date
      transitions :from => :level_2, :to => :level_1, :on_transition => :add_status_date
      transitions :from => :level_3, :to => :level_1, :on_transition => :add_status_date
      transitions :from => :level_4, :to => :level_1, :on_transition => :add_status_date
      transitions :from => :level_5, :to => :level_1, :on_transition => :add_status_date
    end
    
  end

  def add_status_date
    self.status_at = Time.now
  end

  def cardbox_belongs_to_current_user
    errors.add(:cardbox, _("es dürfen nur Karten in die eigene Kartenbox gelegt werden")) unless
      cardbox.user == current_user
  end

end
