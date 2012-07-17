class User < ActiveRecord::Base
  attr_accessible :nom, :prenom, :email, :password, :password_confirmation
  attr_accessor :password
  has_many :dispos
  has_many :statuts, :through => :dispos
  
  before_save :encrypt_password
  
  validates_confirmation_of :password, :message => 'Attention, mot de passe different'
  validates_presence_of :password, :on => :create, :message => "Et le mot de passe ? :)"
  validates_presence_of :nom, :message => "Le nom est obligatoire", :on => :create
  validates_presence_of :prenom, :message => "Le prenom est obligatoire"
  validates_presence_of :email, :message => "L'email est obligatoire"
  validates_uniqueness_of :email, :message => "Email deja existant"
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  
  scope :of_day, lambda { |day| where(:jour => day.beginning_of_day..day.end_of_day) }
  
   def full_name
      [prenom, nom].join(" ")
    end
  
    def self.authenticate(email, password)
      user = find_by_email(email)
      if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
        user
      else
        nil
      end
    end
      
    def encrypt_password
        if password.present?
          self.password_salt = BCrypt::Engine.generate_salt
          self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
        end
    end
end
