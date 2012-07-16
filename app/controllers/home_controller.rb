class HomeController < ApplicationController
  skip_before_filter :require_login
  def index
      @users = User.all
      
      
      @nbr_dispos = Dispo.count(:statut_id, :conditions => ['statut_id = ?', '1'])
      @nbr_staffe = Dispo.count(:statut_id, :conditions => ['statut_id = ?', '2'])
      @nbr_malade = Dispo.count(:statut_id, :conditions => ['statut_id = ?', '3'])
      @nbr_nesaitpas = Dispo.count(:statut_id, :conditions => ['statut_id = ?', '4'])
      @total = Dispo.count(:statut_id)
      
      @lundi = Date.current().beginning_of_week(start_day = :monday) 

  end
end
