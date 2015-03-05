class Contract < ActiveRecord::Base
    belongs_to :user
    has_many :timeentries
    validates :hours, numericality: {greater_than_or_equal_to: 0}
    validates :wage, numericality: {greater_than_or_equal_to: 0}
    validate :validate_end_date_before_start_date
    
    def validate_end_date_before_start_date
        if self.end_date && self.start_date
            Rails.logger.debug self.inspect
            errors.add(:end_date, " needs to be after start date") if self.end_date < self.start_date
        end
    end
    
end
