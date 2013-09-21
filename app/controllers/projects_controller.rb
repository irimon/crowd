class ProjectsController < ApplicationController
before_filter :authenticate_user! , :except => [:search, :projects_map]


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
  
  def compare
		@compare_projs = Array.new
		if params[:checked_ids]
			for c_id in params[:checked_ids]
				proj = Project.find_by_id(c_id) 	
				@compare_projs << proj
			end		
		end
end
  
  def create_demo_projects 
	first_project = Project.find(:first)
	if (first_project != nil)
		ind = first_project.id+1
	else
		ind=1
	end
	years = [2013,2014]
	kind_arry = ["Solar","Wind","Hydro","Other"]
	pic_array = ["wind_1.jpg" , "wind_2.jpg", "wind_3.jpg",
					"solar_1.jpg" , "solar_2.jpg", "solar_3.jpg",
					"hydro_2.jpg", "recycle_1.jpg", "recycle_2.jpg","plant.jpg"]
	for i in 0..9
		par_num = rand(0..4)
		if par_num == 0
			desc = Lorem::Base.new('words', rand(5..50)).output
		else
			desc = Lorem::Base.new('paragraphs', par_num).output
		end
		proj_name_list = ['Eastshore Wind Farms' ,'North Plains Wind', 'Baltic Sea Wind Farm', 'Mid Atlantic Solar', 'Mohaby Desert Solar' ,  'Green Sun Mexico', 'Medeteranian Hydro', 
							'New Delhi Trash',  'Recycle Sau Paulo', 'Pacific Ocean plantation']
		rand_amount = rand(1..20)*100000
		rand_received = rand(1..7)*100000
		fully_funded = rand_received >= rand_amount 
		if fully_funded
			percent_funded = 1
		else
			percent_funded = rand_received.to_f/rand_amount
		end
		rand_proj_num = rand(0..9)
		rand_kind = rand(0..3)
		pic = pic_array[rand_proj_num]
		rand_name = proj_name_list[rand_proj_num]
		rand_date = Date.new(years[rand(0..1)],rand(1..12),rand(1..28))
		@project = Project.create( name: rand_name, amount: rand_amount,
							  phase: nil, end_date: rand_date, picture_url: pic, description: desc, funding_received: rand_received , fully_funded: fully_funded, percent_funded: percent_funded,
							  project_kind: kind_arry[rand_kind], latitude: rand(20..50), longitude: rand(-90..90) , interese: rand(5..15))
					
							  
		#@project.update_funding(0)
	end
	render 'projects/add_new'
	
end

def reset_demo_projects
		 Project.destroy_all
	     render 'static_pages/home'		 
end
  
  def search
		if params[:search]
			@projects = Project.find(:all, :conditions => ['name LIKE ?', "%#{params[:search]}%"])
		else
			@projects = Project.find(:all)
		end
   end
   
   def show 
		if params[:selected_id]
			@project = Project.find_by_id(params[:selected_id])
		end		
	end
	
	def join 
		@inv = params[:investment] 
		if params[:selected_id]
			@project = Project.find_by_id(params[:selected_id])
			Rails.logger.info(@project.errors.messages.inspect)
			if @inv
			    Rails.logger.info(@inv)
				new_amount = @project.funding_received + @inv.to_i
				new_percent = new_amount/@project.amount.to_i
				if new_percent > 1
					new_percent=1
					new_fully_funded = true
					@project.update_attribute(:fully_funded, new_fully_funded)
				end
				@project.update_attribute(:percent_funded, new_percent)
				@project.update_attribute(:funding_received, new_amount)
			end
		end		
		
		if !current_user.relationships.find_by_project_id(params[:selected_id]) 	
			current_user.relationships.join_project(@project)
		end
		
	end	
	
	def unpdate_investment 
		@project = Project.find_by_id(params[:selected_id])
		puts params[:investment]
		Rails.logger.info(@project.errors.messages.inspect)
		if params[:selected_id]
			@project = Project.find_by_id(params[:selected_id])
			if params[:investment]
				new_amount = funding_received = funding_received + params[:investment]
				new_percent = funding_received/amount
				if new_percent > 1
					new_percent=1
					new_fully_funded = true
					@project.update_attribute(:fully_funded, new_fully_funded)
				end
				@project.update_attribute(:percent_funded, new_percent)
				@project.update_attribute(:funding_received, new_amount)
			end
		end		
		render 'show'
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
		@json = all_proj.to_gmaps4rails do |project, marker|
			marker.infowindow render_to_string(:partial => "/projects/mapinfo", :locals => { :project => project})
			marker.title "#{project.name}"
			marker.picture({
					:picture => arr[rand(0..2)]
			})
		end
		
	end
   
end
