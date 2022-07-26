class Gig

    include Mongoid::Document

    field :title, type: String
    field :categories, type: String
    field :skill, type: String
    field :currency, type: String
    field :cost, type: Float
    field :description, type: String
    field :email, type: String

    validates :skill, :presence => true

end