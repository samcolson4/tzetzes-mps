class MpsController < ApplicationController
  before_action :authenticate_user!

  def index
    # @mps = Mp.all
    @mp_data = Mp.page(params[:page]).per(50)
  end

  def show
    @mp = Mp.friendly.find(params[:id])
  end

end
