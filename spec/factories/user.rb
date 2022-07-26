class User
  include Mongoid::Document
  include Mongoid::Timestamps::Created


  ## Admin?

  field :admin, :type => Boolean, :default => false

  ## Database authenticatable
  field :email,              :type => String, :default => ""
  field :encrypted_password, :type => String, :default => ""
  field :provider, :type => String
  field :uid, :type => String
  field :address, :type => String, :default => ""
  field :name, :type => String, :default => ""
  field :img, :type => String, :default => ""
  field :skill, :type => String, :default => ""
  field :review, :type => Integer, :default => 0
  field :category, :type => String, :default => ""


end