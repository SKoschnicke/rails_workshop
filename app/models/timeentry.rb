class Timeentry < ActiveRecord::Base
  has_and_belongs_to_many :tags
  belongs_to :user
  belongs_to :contract

  validates :duration, numericality: {greater_than_or_equal_to: 0}
end
