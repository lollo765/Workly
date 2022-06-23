class Lavoro
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :user

  field :title, type: String
  field :description, type: String
  field :n_Lavoratori, type: Integer
  field :categories, type: String
  field :skill_Lavoratori, type: String, :default => ""
  field :timer, type:Integer
  field :cost, type: Integer
  field :currency, type: String
  field :candidates, type: Array
  field :email, type: String

  validates :title, :presence => true, uniqueness: { case_sensitive: false}
  validates :description, :presence => true, length: {minimum: 10}
  validates :n_Lavoratori, :presence => true
  validates :categories, :presence => true
  validates :skill_Lavoratori, :presence => true
  validates :timer, :presence => true
  validates :currency, :presence => true

  def self.search(input) 
    if input
        any_of({title: /#{input}/i}, {description: /#{input}/i}, {categories: /#{input}/i}, {skill_Lavoratori: /#{input}/i})
    end
  end

end
