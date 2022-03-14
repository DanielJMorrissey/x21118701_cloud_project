class HomepageController < ApplicationController
  def index
  end

  # get "/bands" different page than newbands
  def bands
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
    @bandgenre = params[:genre]
    @band = Band.new(name:@bandname, country:@bandcountry, members:@bandmembers.to_i, genre:@bandgenre)
    if @band.save
      redirect_to "/"
    else
      render :bands
    end
  end

  private
  def band_params
    params.require(:band).permit(:name, :country, :members, :genre)
  end
end
