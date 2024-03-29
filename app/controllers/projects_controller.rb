class ProjectsController < ApplicationController
before_filter :authenticate_user! , :except => [:search, :projects_map]
before_filter :admin_user,     only: [:add_new]
 helper_method :sort_column, :sort_direction

 def add_new
	# if current_user.admin?
		@project = Project.new
	# end
  end
  
   def create
	
		elem = params[:project]
		elem.inspect
		
		
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
  
  def feed 
		@title = "FEED title"
		
		#@news_items = NewsItem.find_by_project_id(params[:project_id]).sort_by("updated_at desc")
		@project = Project.find_by_id(params[:project_id])
	  	@news_items = @project.news_items.sort_by{|i| i.updated_at}
		@updated = @news_items.first.updated_at unless @news_items.empty?

	  
		respond_to do |format|
			format.atom { render :layout => false }
			# we want the RSS feed to redirect permanently to the ATOM feed
			format.rss { redirect_to feed_path(:format => :atom), :status => :moved_permanently }
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
					"hydro_2.jpg", "big_waste.jpg", "energy-from-waste.jpg","plant.jpg"]
					
	proj_desc_list  = ['The Eastshore Wind Farms Project is a wind farm located on Backbone Mountain east of Oakland, Maryland, United States. 
		The project has a rated capacity of 70 MW and uses 28 Liberty Wind Turbines manufactured by Clipper Windpower. Each of the wind turbines is about 415 feet tall. 
		The Criterion Wind Project is owned by Criterion Power Partners, LLC, which is a subisiary of Exelon, and interconnected with the transmission system of the 
		Potomac Edison Company (a subsidiary ofFirstEnergy). Electricity and renewable energy credits from the project will be sold to the Old Dominion Electric Cooperative 
		under a 20 year supply contract.',
		'The North Plains Wind Project is 25MW wind farm with a proposed expansion to 5,050 MW, formerly known as Rolling Thunder, based in South Dakota. 
		The project developers, Clipper Windpower and BP Alternative Energy, expect to build Titan in several phases and, when completed, it will be one of the largest
		wind farms in the world. The complete wind farm would use up to 2,020 of Clippers Liberty 2.5 MW wind turbines.',
		'The Baltic Sea Wind Project is an approved offshore wind farm on the Baltic sea. The project is proposed by a private developer Baltic Wind Associates.
		 The wind farm may become the first offshore wind energy project in Bulgaria coastal waters.',
		'Mid Atlantic Solar, is being built on the shores of Spain by Torresol Energy using previous solar projects technology for commercial electrical production of 15 MW. 
		 Mid Atlantic Solar will be a massive 2,500 heliostats, each with a reflective surface of 96 m^2. The total reflective area will be 240,000 m^2 (2.6 million ft^2). 
		 They will be made of a highly reflective glass with metal back to cut costs by about 45%. A larger molten nitrate salt storage tank will be used giving the plant 
		 the ability to store 600 MWh, allowing the plant to run 24x7 during the summer.',
		 'Mohaby Desert is a solar-thermal project built in the Mohaby Desert. It is a large-scale thermal solar power tower plant that was designed by the Department of Energy (DOE).
		 Mohaby Desert method of collecting energy is based on concentrating the sun energy onto a common focal point to produce heat to run a steam turbine generator. 
         It has hundreds of large mirror assemblies, or heliostats that track the sun, reflecting the solar energy onto a tower where a black receiver absorbed the heat. 
		 High-temperature heat transfer fluid is used to carry the energy to a boiler on the ground where the steam was used to spin a series of turbines, much like a 
		 traditional power plant.',
		'The Green sun Mexico Project is the world largest photovoltaic solar generating facility, currently being built in northern Mexico using thin film solar 
		 panels manufactured by First Solar. The project is expected to be completed in 2014, when it will reach an installed capacity of 397 MWp.
		 The Series 3 thin film panels use CdS/CdTe, and are rated from 75 watts to 77 watts each, and are mounted at a fixed tilt angle. 20,940 are connected in each array, 
		 rated at 1.26 MW AC, and over 400 SMA 720CP inverters are used. Two inverters are connected to each array.', 
		 'The Mediterranean Hydroelectric Project is a complex project consisting of total three dams with the largest Dam built on the Nile River. 
		 The project uses potential of water from the black Nile River. The project site is situated in the northern part of Sudan. 
         The total Installed capacity of the project is 1,960 MW. The project consists of 3 stages of power generation. 
		 All the generators are located in the underground Powerhouses excavated deep inside the surrounding mountains. A dam foot powerhouse also contributes to the 
		 electricity generation.',
		 'Bangkok Waste is a municipal waste incinerator and waste-to-energy power station, which provides 29.2 megawatts (MW) of electricity for the National Grid 
		 by burning 390,000 tons of household and commercial waste a year. It is located on the outskirts of Bangkok, Thailand.',
		 'Recycle Sau Paulo is a biogas plant that processes waste from a number of sectors that is difficult to recycle separately. Everything goes into it: 
		 fish waste, sorted organic household waste, fizzy drinks, beer, alcohol, pharmaceuticals, food contaminated with bacteria or chemicals, any organic 
		 matter with a high fat, protein or sugar content. The plant also processes slurry from 75 farms. The project will produce over 21 million kWh of electricity 
		 annually as well as over 18 million kWh of heat from cooling installations. The energy produced will be used for covering the needs of one thousand homes!',
		 'The Pacific Ocean Waves is a wave farm off the shores of Japan. It is located 5 km (3 mi) offshore near Tokyo. The farm is designed to use three Pelamis wave energy
		 converters to convert the motion of the ocean surface waves into electricity, totalling to 2.25 MW in total installed capacity.
		 The farm will be finished by the end of 2014.']

	proj_name_list = ['Eastshore Wind Farms' ,'North Plains Wind', 'Baltic Sea Wind Farm', 'Mid Atlantic Solar', 'Mohaby Desert Solar' ,  'Green Sun Mexico', 'Mediterranean Hydro', 
							'Bangkok Waste',  'Recycle Sau Paulo', 'Pacific Ocean Waves']
					
	for i in 0..9
		par_num = rand(0..4)
		
	
		rand_amount = rand(1..20)*100000
		rand_received = rand(1..7)*100000
		fully_funded = rand_received >= rand_amount 
		
		if fully_funded
			percent_funded = 1
		else
			percent_funded = rand_received.to_f/rand_amount
		end
		rand_proj_num = i #rand(0..9)
	
		case rand_proj_num
			when 0..2
				rand_kind = 1
			when 3..5
				rand_kind = 0
			when 6
				rand_kind = 2
			when 7..8
				rand_kind = 3
			when 9
				rand_kind = 3
			else
			  puts "You gave me #{rand_proj_num} -- I have no idea what to do with that."
		end
   	    rand_kwh = rand(100..2000)*1500
		pic = pic_array[rand_proj_num]
		rand_name = proj_name_list[rand_proj_num]
		desc = proj_desc_list[rand_proj_num]
		rand_date_delta =  rand(0..90)
		rand_date = DateTime.now + rand_date_delta.day
		@project = Project.create( name: rand_name, amount: rand_amount,
							  phase: nil, end_date: rand_date, picture_url: pic, description: desc, funding_received: rand_received , fully_funded: fully_funded, percent_funded: percent_funded,
							  project_kind: kind_arry[rand_kind], latitude: rand(20..50), longitude: rand(-90..90) , interese: rand(5..15), 
							payment_number: rand(10..20)*12 , first_payment: rand_date + rand(100..600), yearly_kwh: rand_kwh)
					
		 title_1 = 	rand_name + " starts funding round"
		 content_1 = "On " +	" we will aim to raise " + rand_amount.to_s + "$ - come and join us"
		 author = rand_name + "management"
		 @news_item= NewsItem.create(title: title_1 , content: content_1, auther: author, project_id: @project.id)
		 
		 if fully_funded 
			 title_1 = 	rand_name + " has successfully raised " + rand_amount.to_s + "$ !"
			 content_1 = "Thank you so much for all our supporters.  Through your investment we will make a true impact on the environment and create new jobs.
			 Expect to see periodic updates on the project's progress."
			 author = rand_name +  "management"
			 @news_item= NewsItem.create(title: title_1 , content: content_1, auther: author, project_id: @project.id)
		 end
		 
	end

	@company = Company.create(company_name: "Focal" , description: "An Active Management and Holding Company that develops, manages and owns renewable energy power plants 
									The company runs projects in Biomass (farming waste), Hydro (run-of-the-river), Solar and Wind, with an initial focus on India.
									The company  has a steady cash flow from income-generating conservative projects", website: "http://focal-energy.com")
									
	@project = Project.create( name: "Sathyam" , amount: 3800000,
							  phase: nil, end_date: DateTime.now - 500.day, picture_url: "sathyam.png", description: "10 Mw mustard-based power plant in Rajasthan, India. 
										A Joint enterprise with an experienced local group as a junior partner. 20-year power purchase agreement with plentiful supply of fuel in the area.  
										Fuel is procured directly from farmers or intermediaries who in turn buy directly from individual farmers.  
										Farmers and intermediaries bring the fuel with tractors and trucks from the fields to our plant location ", 
										funding_received: 3800000 , fully_funded: true, percent_funded: 1,
										project_kind: "Biomass", latitude: 26.65, longitude: 74.03 , interese: 5, 
										payment_number: 120 , first_payment: DateTime.now - 200.day, yearly_kwh: 10000, company_id: @company.id)
	
	title_1 = 	"Great news! Tariff is higher than we originally projected"
	content_1 = "Recent data from the local government shows we are looking at better tariff than what we originally planned. 
				 We will update our projections accordingly."
	author = "The Focal team"
	@news_item= NewsItem.create(title: title_1 , content: content_1, auther: author, project_id: @project.id)
	
	title_1 = 	"Plant utilization status report"
	content_1 = "Even though average plant utilization thus far is much below post-stabilization expectations, 
				the project has occasionally performed at its full potential. 
				
				Average plant utilization has not achieved desirable levels due to boiler temperature control 
				issues associated specifically with the use of mustard husk, which led to frequent leakages and a 
				need to operate at partial capacity. A shutdown and some design modifications was carried out 2012 to address some of the above boiler issues.  
				Remaining boiler desired enhancements have been analyzed and solution shall be implemented in late 2013.
				"
	author = "The Focal team"
	@news_item= NewsItem.create(title: title_1 , content: content_1, auther: author, project_id: @project.id)

	title_1 = 	"Consumption numbers are looking promising"
	content_1 = "Fuel consumption per unit and auxiliary consumption (both critical technical measures) are already good and on a positive improvement trend"
	author = "The Focal team"
	@news_item= NewsItem.create(title: title_1 , content: content_1, auther: author, project_id: @project.id)

	@project = Project.create( name: "Prakriti" , amount: 5500000,
							  phase: nil, end_date: DateTime.now + 100.day, picture_url: "Prakriti.jpg", description: "12 Mw mustard-based power plant in Rajasthan, India. 
										Partnership with a junior experienced local group. 20-year Power Purchase Agreement with plentiful supply of fuel in the area. 
										All steps till the clearance from SLEC (Project awarding body of State Government) have been completed. Board Government of Rajasthan will not
											allow any new plant within 80 km radius from the plant for safeguarding biomass procurement. ", 
											funding_received: 1000000 , fully_funded: false, percent_funded: 0.18,
							  project_kind: "Biomass", latitude: 26.014, longitude: 76.35 , interese: 5, 
							  payment_number: 120 , first_payment: DateTime.now + 800.day, yearly_kwh: 12000, company_id: @company.id)
							  
	render 'projects/add_new'
	
end

def reset_demo_projects
		 Project.destroy_all
	     render 'static_pages/home'		 
end
  
  def search
		if params[:search]
			@projects = Project.paginate(page: params[:page],:per_page => 12).find(:all, :conditions => ['name LIKE ?', "%#{params[:search]}%"])
		else
			@projects = Project.paginate(page: params[:page],:per_page => 12)
		end
		
		if params[:sort_by_type]
			@projects = Project.paginate(page: params[:page],:per_page => 12).find(:all, :conditions => ['project_kind LIKE ?', "%#{params[:sort_by_type]}%"])
		end
		
		
		if params[:sort_by_pledged]
			if params[:sort_by_pledged]=="high" 
				@projects = Project.order("amount desc").paginate(page: params[:page],:per_page => 12)
			end
			if params[:sort_by_pledged]=="low" 
				@projects = Project.order("amount asc").paginate(page: params[:page],:per_page => 12)
			end
		end
		
		if params[:sort_by_time]
			@projects = Project.paginate(page: params[:page],:per_page => 12).order("end_date asc")
		end
		
		if params[:sort_almost_funded]
			@projects = Project.paginate(page: params[:page],:per_page => 12).order("percent_funded desc")#.find(:all, :conditions => ['percent_funded != "1"'])
		end
		
   end
   
 #   def sort_by_type
		# if params[:sort_type]
			# @projects = Project.paginate(page: params[:page],:per_page => 12).find(:all, :conditions => ['project_kind LIKE ?', "%#{params[:sort]}%"])
		# else
			# @projects = Project.paginate(page: params[:page],:per_page => 12)
		# end
		# render 'projects/search'
 #  end
   
   def show 
		if params[:selected_id]
			@project = Project.find_by_id(params[:selected_id])
		end		
	end
	
	# def join 
		# @inv = params[:investment] 
		# if params[:selected_id]
			# @project = Project.find_by_id(params[:selected_id])
			# Rails.logger.info(@project.errors.messages.inspect)
			# if @inv
			    # Rails.logger.info(@inv)
				# new_amount = @project.funding_received + @inv.to_i
				# new_percent = new_amount/@project.amount.to_i
				# if new_percent > 1
					# new_percent=1
					# new_fully_funded = true
					# @project.update_attribute(:fully_funded, new_fully_funded)
				# end
				# @project.update_attribute(:percent_funded, new_percent)
				# @project.update_attribute(:funding_received, new_amount)
			# end
		# end		
		
		# if !current_user.relationships.find_by_project_id(params[:selected_id]) 	
			# current_user.relationships.join_project(@project,@inv)
		# end
		
	# end	
	
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
   def show_project_location
		arr = ["https://spartanyouth.msu.edu/images/icon_sun.gif" , 
		"https://wiki.openstreetmap.org/w/images/d/d5/Power_wind.png" ,
		"https://www.vtenergyatlas-info.com/wp-content/uploads/2010/02/icon_hydro_potential.png"]
		@project = Project.find_by_id(params[:selected_id])	
		@json = @project.to_gmaps4rails do |project, marker|
			 marker.infowindow render_to_string(:partial => "/projects/mapinfo", :locals => { :project => project})
			marker.title "#{project.name}"
			marker.picture({
					:picture => arr[(project.project_kind == "hydro") ? 2 : ((project.project_kind == "Wind") ? 1 : 0)]
			})
		end
	end
	
   def projects_map
		
		all_proj = Project.all
		
		all_proj.each do |proj| 
			if (proj.latitude == nil) 
				proj.latitude = rand(20..50) #42.3616 #rand(20..40)
				proj.longitude = rand(-90..90) #-71.084586 #rand(20..40)
			end
		end
		
		arr = ["http://spartanyouth.msu.edu/images/icon_sun.gif" , 
		"http://wiki.openstreetmap.org/w/images/d/d5/Power_wind.png" ,
		"http://www.vtenergyatlas-info.com/wp-content/uploads/2010/02/icon_hydro_potential.png"]
		@json = all_proj.to_gmaps4rails do |project, marker|
			marker.infowindow render_to_string(:partial => "/projects/mapinfo", :locals => { :project => project})
			marker.title "#{project.name}"
			marker.picture({
					:picture => arr[(project.project_kind == "Hydro") ? 2 : ((project.project_kind == "Wind") ? 1 : 0)]
			})
		end
		
	end
	

  
  def compare
		if params[:checked_ids]
			@compare_projs = Project.find(params[:checked_ids].split())
		end
	end
	
	
	private
	
	def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
   
   
  
end
