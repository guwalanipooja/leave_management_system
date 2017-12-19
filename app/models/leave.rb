class Leave < ApplicationRecord
  belongs_to :user

  validates :start_date, :end_date, :reason_for_leave, :status, presence: true

  enum status: [:pending, :approve, :rejected]

  def total_days
    if self.start_date.present? && self.end_date.present?
      weekdays_in_date_range( self.start_date..end_date )
    end
  end

  protected
  def weekdays_in_date_range(range)
    range.select { |d| (1..5).include?(d.wday) }.size
  end
end
