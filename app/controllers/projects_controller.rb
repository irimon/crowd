class ProjectsController < ApplicationController
 def add_new
	 @project = Project.new
  end
  
   def create
		# pic = params[:project][:pic]
		# pic.inspect
		elem = params[:project]
		elem.inspect
		# File.open(Rails.root.join('public', 'uploads', pic.original_filename), 'w') do |file|
			# file.write(pic.read)
		# end
		
		@project = Project.create(params[:project])
		if (@project.project_kind == 'Solar')
			@project.picture_url = '../assets/suncomp.jpg'
		end
		if (@project.project_kind == 'Wind')
			@project.picture_url = '../assets/windcomp.jpg'
		end
		@project.save
		render 'projects/add_new'
  end
 
  def search
		if params[:search]
			@projects = Project.find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
		else
			@projects = Project.find(:all)
		end
   end
   
   def projects_map
		
		all_proj = Project.all
		
		all_proj.each do |proj| 
			if (proj.latitude == nil) 
				proj.latitude = rand(20..50) #42.3616 #rand(20..40)
				proj.longitude = rand(-90..90) #-71.084586 #rand(20..40)
			end
			#@json=proj.to_gmaps4rails
		end
		
		#@json=all_proj.to_gmaps4rails -- working
		arr = ["http://spartanyouth.msu.edu/images/icon_sun.gif" , 
		"http://wiki.openstreetmap.org/w/images/d/d5/Power_wind.png" ,
		"http://www.vtenergyatlas-info.com/wp-content/uploads/2010/02/icon_hydro_potential.png"]
		@json = all_proj.to_gmaps4rails do |device, marker|
			marker.picture({
					:picture => arr[rand(0..2)]
			})
		end
		
		
		#@json = Project.all.to_gmaps4rails
		#@json = Project.all.to_gmaps4rails
		#respond_with @json
	end
   
end
