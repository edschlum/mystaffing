class Dispo < ActiveRecord::Base
  attr_accessible :jour, :statut_id, :user_id, :comments
  belongs_to :user
  belongs_to :statut
  
  validates_presence_of :statut_id, :message => "Merci de saisir une dispo !"

  
  scope :of_day, lambda { |day| where(:jour => day.beginning_of_day..day.end_of_day) }
end
