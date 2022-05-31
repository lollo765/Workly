class Gig

    include Mongoid::Document

    field :title, type: String
    field :categories, type: String
    field :skill, type: String
    field :currency, type: String
    field :cost, type: Integer
    field :description, type: String

end
