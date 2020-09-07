class PracticeSession < ActiveRecord::Base
    belongs_to :user
    validates :date, presence: true
    validates :practice_item, presence: true
end