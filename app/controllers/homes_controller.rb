class HomesController < ApplicationController
  
  def index
    if params[:story_type].present?
      if params[:story_type] == "ask"
        @stories = client.askstories(0,10)
      elsif params[:story_type] == "jobs"
        @stories = client.jobstories(0,10)
      elsif params[:story_type] == "show"
        @stories = client.showstories(0,10)
      elsif params[:story_type] == "top"
        @stories = client.topstories
      end
    else
      @stories = client.topstories
    end
  end

  def profile
    if params[:id].present? 
      @profile = client.userprofile(params[:id])
    end
    @profile
  end

end
