class HomeController < ApplicationController
  
  before_filter :login_required, :only => 'me'

  def index
    @last_lotto_draw = LottoDraw.first
    @last_lotto_plus_draw = LottoPlusDraw.first
  end

  def me
    
  end

end
