class Course < ApplicationRecord
    #This is plumbing - tells us courses are proprietary to users
    belongs_to :user
    
    validates :title, presence: true 
    validates :description, presence: true
    validates :cost, presence: true, numericality: {greater_than_or_equal_to: 0}
end
