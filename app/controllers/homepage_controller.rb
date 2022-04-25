class HomepageController < ApplicationController

  # get "/" - homepage
  def index
    set_meta_tags description: "A band and artist recommendation website where people can add bands and artists they recommend and checkout bands and artists that other people recommend", keywords: %w[music homepage recommend recommendation band artist], title: "Homepage"
  end

  # get "/bands" - band listings, most recent first
  def bands
    set_meta_tags description: "A band and artist recommendation website where people can add bands and artists they recommend and checkout bands and artists that other people recommend", keywords: %w[music bands list recommend recommendation band artist], title: "Bands"
    @bands = Band.all.order("id Desc")
  end

  # new- get /newbands, maps form to database
  def newbands
    set_meta_tags description: "A band and artist recommendation website where people can add bands and artists they recommend and checkout bands and artists that other people recommend", keywords: %w[music new bands artists recommend recommendation band artist], title: "Add a New Band"
    @band = Band.new
  end

  # create- submitting a new band / artist
  # post "/newbands"
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
