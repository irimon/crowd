class NewsItemsController < ApplicationController

respond_to do |wants|
  wants.html
  wants.atom {render :action=>'index',:layout=>false}
end

def show
	@news_item = NewsItem.find_by_id(params[:id])
end

def index
	@news_item = NewsItem.all
end
def create
	@news_item = NewsItem.create(title: params[:title], content: params[:content], auther: params[:author], project_id: params[:project_id])
	redirect_to show_project_path(:selected_id => params[:project_id])
end 

 def feed
    @title = "FEED title"
	
	if (params[:project_id].nil?)
		@news_items = NewsItem.order("updated_at desc")
	else 
		@project = Project.find_by_id(params[:project_id])
		@news_items = @project.news_items.sort_by{|i| i.updated_at}
	end
  
    @updated = @news_items.first.updated_at unless @news_items.empty?

  
	respond_to do |format|
		format.atom { render :layout => false }
		# we want the RSS feed to redirect permanently to the ATOM feed
		format.rss { redirect_to feed_path(:format => :atom), :status => :moved_permanently }
	end
  end
end
