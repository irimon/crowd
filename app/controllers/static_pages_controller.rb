class StaticPagesController < ApplicationController
  def landing_page
   render :layout => "layout_without_header"
  end
  
   def contact_company
	render :layout => "layout_without_header"
  end
  
  def home
  end

  def look_for_project
  end

  def start_project
  end

  def portfolio
  end

  def about
  end
end
