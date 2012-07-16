class Statut < ActiveRecord::Base
  attr_accessible :intitule
  has_many :dispos
  has_many :users, :through => :dispos
  
end
