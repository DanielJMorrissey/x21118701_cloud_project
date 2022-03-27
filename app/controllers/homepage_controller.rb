class HomepageController < ApplicationController
  def index
  end

  # get "/bands" different page than newbands
  def bands
    @bands = Band.all.order("id Desc")
  end

  # new- get /newbands
  def newbands
    @band = Band.new
  end


  # create- post /bands
  def newbandscompute
    @band = Band.new
    @bandname = params[:name]
    @bandcountry = params[:country]
    @bandmembers = params[:members]
    if @bandmembers.to_i < 0
      @bandmembers = @bandmembers.to_i * -1
    elsif @bandmembers.to_i == 0
      @bandmembers = @bandmembers.to_i + 1
    end
    @bandgenre = params[:genre]
    if @bandname.length > 0 and @bandgenre.length > 0
      @band = Band.new(name:@bandname, country:@bandcountry, members:@bandmembers.to_i, genre:@bandgenre)
      if @band.save
        flash[:name] = @bandname
        flash[:country] = @bandcountry
        flash[:members] = @bandmembers
        flash[:genre] = @bandgenre
        @result = "Band Saved"
        flash[:result] = @result
        redirect_to "/newbands"
      else
        flash[:name] = @bandname
        flash[:country] = @bandcountry
        flash[:members] = @bandmembers
        flash[:genre] = @bandgenre
        @result = "Failed to save"
        flash[:result] = @result
        redirect_to "/newbands"
      end
    else
      @result = "Please enter a band name or genre!"
      flash[:result] = @result
      redirect_to "/newbands"
    end
  end
end
