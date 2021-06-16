class SearchController < ApplicationController
  def index
    # @mps = Mp.all
    @mp_data = Mp.page(params[:page])
  end

  def show
    @mp = Mp.find(params[:id])
  end

  def show_name
    @mp = Mp.find(params[:name])
  end

end
