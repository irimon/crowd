class RelationshipsController < ApplicationController
before_filter :authenticate_user!

  def create
	
		@inv = params[:investment]
		@project = Project.find_by_id(params[:selected_id])
		if @inv
			if params[:selected_id]
				
				Rails.logger.info(@inv)
				new_amount = @project.funding_received + @inv.to_i
				new_percent = new_amount.to_f/@project.amount
				old_percent =  @project.funding_received/@project.amount
				if (new_percent >= 1) and (old_percent < 1)
					new_percent=1
					new_fully_funded = true
					@project.update_attribute(:fully_funded, new_fully_funded)
					title = 	 @project.name + " has successfully raised " +  @project.amount.to_s + "$ !"
					content = ""
					author = @project.name +  " management"
					@news_item= NewsItem.create(title: title , content: content, auther: author, project_id: @project.id)
				end
				@project.update_attribute(:percent_funded, new_percent)
				@project.update_attribute(:funding_received, new_amount)
			
			end		
			
		
			if !current_user.relationships.find_by_project_id(params[:selected_id]) 
				relationship = Relationship.new( project_id: @project.id, user_id: current_user.id, amount: params[:investment])
				relationship.build(@project.id, current_user.id, params[:investment])
				
			end
		end
		redirect_to show_project_path(:selected_id => @project.id)
	end
end
