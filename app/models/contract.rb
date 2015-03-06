class Contract < ActiveRecord::Base
  belongs_to :user
  has_many :timeentries
  validates :hours, numericality: {greater_than_or_equal_to: 0}
  validates :wage, numericality: {greater_than_or_equal_to: 0}
  validate :validate_start_date_before_end_date

  def validate_start_date_before_end_date
    if self.end_date && self.start_date
      errors.add(:end_date, " needs to be after start date") if self.end_date < self.start_date
    end
  end

  def hours_fulfilled
    self.timeentries.sum(:duration)
    #self.timeentries.all.reduce{|a, b| a.duration + b.duration} / 60
  end

end
