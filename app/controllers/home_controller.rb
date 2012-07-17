class HomeController < ApplicationController
  skip_before_filter :require_login
  def index
      
      @lundi = Date.current().beginning_of_week(start_day = :monday) 

  end
end
