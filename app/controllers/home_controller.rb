class HomeController < ApplicationController
  
  def index
    @last_lotto_draw = LottoDraw.first
    @last_lotto_plus_draw = LottoPlusDraw.first
  end

end
