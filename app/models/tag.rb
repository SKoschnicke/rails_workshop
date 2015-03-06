class Tag < ActiveRecord::Base
  has_and_belongs_to_many :timeentries
  validates :name, uniqueness: true, presence: true, allow_blank: false
end
