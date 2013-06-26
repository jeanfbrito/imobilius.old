class PropertiesController < ApplicationController
  def index
    @properties = Property.all
    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def new
    @property = Property.new

    respond_to do |format|
      format.html { render :layout => !request.xhr? }
      format.json { render json: @property }
    end
  end

  def create
    @property = Property.new params.require(:property).permit(:description, :value)

    respond_to do |format|
      if @property.save
        format.html { redirect_to @property, notice: 'property was successfully created.' }
        format.json { render json: @property, status: :created, location: @property }
      else
        format.html { render action: "new" }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

end