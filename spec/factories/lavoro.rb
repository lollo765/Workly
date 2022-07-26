class Lavoro
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title, type: String
  field :description, type: String
  field :n_Lavoratori, type: Integer
  field :categories, type: String
  field :skill_Lavoratori, type: String, :default => ""
  field :timer, type:Integer
  field :cost, type: Float
  field :currency, type: String
  field :candidates, type: Array
  field :email, type: String

  validates :title, :presence => true, uniqueness: { case_sensitive: false}
  validates :description, :presence => true, length: {minimum: 10}
  validates :n_Lavoratori, :presence => true
  validates :categories, :presence => true
  validates :skill_Lavoratori, :presence => true
  validates :timer, :presence => true
  validates :cost, :presence => true
  validates :currency, :presence => true

end
