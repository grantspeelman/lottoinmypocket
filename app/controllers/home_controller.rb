class HomeController < ApplicationController
  
  def index
    @last_lotto_draw = LottoDraw.first
  end

end
