class Gig < ApplicationRecord
    
    validates :title, presence: true
    validates :categories, presence: true
    validates :skill, presence: true
    validates :currency, presence: true
    validates :cost, presence: true, numericality: true
    validates :description, presence: true


end
