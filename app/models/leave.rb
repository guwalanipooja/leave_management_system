class Leave < ApplicationRecord
  belongs_to :user

  validates :reason_for_leave, :status, presence: true
  validates_presence_of :start_date, :end_date

validate :end_date_is_after_start_date
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
  private
  def end_date_is_after_start_date
  return if end_date.blank? || start_date.blank?

  if end_date < start_date
    errors.add(:end_date, "cannot be before the start date") 
  end 
end
end
