class ProjectsController < ApplicationController
 def add_new
	 @project = Project.new
  end
  
   def create
   @project = Project.create(params[:project])
   render 'projects/add_new'
  end
 
  def search
		if params[:search]
			@projects = Project.find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
		else
			@projects = Project.find(:all)
		end
   end
   
end
