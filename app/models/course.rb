class Course < ApplicationRecord
    #This is plumbing - tells us courses are proprietary to users
    belongs_to :user
end
