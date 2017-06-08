class VolumesController < ApplicationController

  def show
    @volume = ComicVineService::Volume.new(params[:id])
  end
end
