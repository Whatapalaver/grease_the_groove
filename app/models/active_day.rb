class ActiveDay < ApplicationRecord
  belongs_to :user

  has_many :daily_sessions, dependent: :destroy

  after_create :create_default_daily_sessions

  private

  def create_default_daily_sessions
    daily_sessions.create(name: "Morning", position: 0)
    daily_sessions.create(name: "Afternoon", position: 1)
    daily_sessions.create(name: "Evening", position: 2)
  end
end
