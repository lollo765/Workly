class User
  include Mongoid::Document
  include Mongoid::Timestamps::Created

  devise :omniauthable, :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable, omniauth_providers: [:facebook, :google_oauth2]

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

  ## Password Expirable
  field :password_changed_at, :type => Time

  ## Recoverable
  field :reset_password_token,   :type => String
  field :reset_password_sent_at, :type => Time

  ## Rememberable
  field :remember_created_at, :type => Time

  ## Trackable
  field :sign_in_count,      :type => Integer, :default => 0
  field :current_sign_in_at, :type => Time
  field :last_sign_in_at,    :type => Time
  field :current_sign_in_ip, :type => String
  field :last_sign_in_ip,    :type => String

  ## Encryptable
  field :password_salt, :type => String

  ## Confirmable
  field :confirmation_token,   :type => String
  field :confirmed_at,         :type => Time
  field :confirmation_sent_at, :type => Time
  field :unconfirmed_email,    :type => String # Only if using reconfirmable
  field :deactivated,          :type => Boolean, :default => false


  ## Lockable
  field :failed_attempts, :type => Integer, :default => 0 # Only if lock strategy is :failed_attempts
  field :unlock_token,    :type => String # Only if unlock strategy is :email or :both
  field :locked_at,       :type => Time

  ## Token authenticatable
  field :authentication_token, :type => String

  ## Invitable
  field :invitation_token, :type => String
  field :invitation_sent_at, :type => Time
  field :invitation_accepted_at, :type => Time
  field :invitation_limit, :type => Integer, :default => 0
  field :invited_by_id, :type => String
  field :invited_by_type, :type => String

  def user_params
    params.require(:user).permit(:provider, :uid, :name, :email, :password, :password_confirmation, :encrypted_password)
  end

  def self.search(input) 
    if input
        any_of({name: /#{input}/i, email: /#{input}/i})
    end
  end

  # run 'rake db:mongoid:create_indexes' to create indexes
  index({ email: 1 }, { unique: true, background: true })

  def will_save_change_to_email?
    false
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
    end
  end

end