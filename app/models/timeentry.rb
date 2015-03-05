class Timeentry < ActiveRecord::Base
  has_and_belongs_to_many :tags
  belongs_to :user
  belongs_to :contract
end
