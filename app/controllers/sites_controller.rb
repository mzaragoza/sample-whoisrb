class SitesController < ApplicationController

  def new
    @site = Site.new
  end

  def create
    name = params[:site][:name]
    @site = Site.create(name: name)
    redirect_to site_path(@site)
  end

  def show
    @site = Site.find(params[:id])
    c = Whois::Client.new
    @r = c.lookup(@site.name)
  end

end

