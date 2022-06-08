class Gig

    include Mongoid::Document

    field :title, type: String
    field :categories, type: String
    field :skill, type: String
    field :currency, type: String
    field :cost, type: Integer
    field :description, type: String
    field :email, type: String

    def self.search(input) 
        if input
            any_of({title: /#{input}/i}, {categories: /#{input}/i}, {description: /#{input}/i})
        end
    end

    def self.search_for_skills(input) 
        if input
            any_of({skill: /#{input}/i})
        end
    end

end
