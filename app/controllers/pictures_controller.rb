class PicturesController < ApplicationController

  def index
    #@pictures = Picture.all
    #render :json => @pictures.collect { |p| p.to_jq_upload }.to_json
    render :json => [].to_json
  end

  def create
    @picture = Picture.new params.require(:picture).permit(:file, :file_uid, :file_name, :property_id)
    #@task = Task.new(:parent_id => params[:parent_id], :project_id => params[:project_id])

    if @picture.save
      respond_to do |format|
        format.html {  
          render :json => [@picture.to_jq_upload].to_json, 
          :content_type => 'text/html',
          :layout => false
        }
        format.json {  
          #render :json => [@picture.to_jq_upload].to_json 
          render json: {files: [@picture.to_jq_upload]}, status: :created, location: @picture    
        }
      end
    else 
      render :json => [{:error => "custom_failure"}], :status => 304
    end
  end

  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy
    render :json => true
  end
end