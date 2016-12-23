class Message < ApplicationRecord

  belongs_to :user

  has_many :comments, :dependent => :destroy

  has_many :likes, :dependent => :destroy
  has_many :subscriptions, :dependent => :destroy

  scope :pending, -> { where( :status => "pending" ) }
  scope :completed, -> { where( :status => "completed" ) }

  def last_comment_summary
    self.comments.last.try(:content).try(:truncate, 20)
  end
  def self.within_days(how_many)
    where( ["created_at >= ?", Time.now - how_many.days ] )
  end

end
