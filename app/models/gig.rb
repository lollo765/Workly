class Gig < ApplicationRecord
    
    validates :title, presence: true
    validates :categories, presence: true
    validates :skill, presence: true
    validates :currency, presence: true


end
