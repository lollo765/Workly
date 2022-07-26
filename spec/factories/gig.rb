class Gig

    include Mongoid::Document

    belongs_to :user

    field :title, type: String
    field :categories, type: String
    field :skill, type: String
    field :currency, type: String
    field :cost, type: Float
    field :description, type: String
    field :email, type: String

    validates :skill, :presence => true

    def self.search(input) 
        if input
            any_of({title: /#{input}/i}, {categories: /#{input}/i}, {description: /#{input}/i}, {skill: /#{input}/i})
        end
    end

    def self.search_for_skills(input) 
        if input
            any_of({skill: /#{input}/i})
        end
    end

end