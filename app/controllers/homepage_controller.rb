class HomepageController < ApplicationController
  def index
  end

  # get "/bands" - band listings, most recent first
  def bands
    @bands = Band.all.order("id Desc")
  end

  # new- get /newbands, maps form to database
  def newbands
    @band = Band.new
  end

  # create- submitting a new band / artist
  def newbandscompute
    @band = Band.new
    # getting input values from form
    @bandname = params[:name]
    @bandcountry = params[:country]
    @bandmembers = params[:members]
    # making sure bandmembers variable is an integer that is >= 1
    if @bandmembers.to_i < 0
      @bandmembers = @bandmembers.to_i * -1
    elsif @bandmembers.to_i == 0
      @bandmembers = @bandmembers.to_i + 1
    end
    @bandgenre = params[:genre]
    # making sure band name and genre inputs are filled in
    if @bandname.length > 0 and @bandgenre.length > 0
      # inserting data
      @band = Band.new(name:@bandname, country:@bandcountry, members:@bandmembers.to_i, genre:@bandgenre)
      # making form sticky by keeping input values
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
