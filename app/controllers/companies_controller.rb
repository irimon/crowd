class CompaniesController < ApplicationController
  def new
	@company = Company.new
  end
  
  def create
    @company = Company.new(params[:company])
	@company.save
	render 'new'
  end
  
  def show
	
end
