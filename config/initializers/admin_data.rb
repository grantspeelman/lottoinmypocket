# To change this template, choose Tools | Templates
# and open the template in the editor.
if Rails.env == 'development'
	AdminData.config do |config|
	  config.number_of_records_per_page = 50
	  config.columns_order = { 'Ball' => [:ball, :lotto_draw_count],
							   'TwoBallCombo' => [:ball1, :ball2, :lotto_draw_count],
							   'ThreeBallCombo' => [:ball1, :ball2, :ball3, :lotto_draw_count],
							   'LottoDraw' => [:number,:date,:ball1 ,:ball2 ,:ball3 ,:ball4 ,:ball5 ,:ball6 ,:bonus_ball]}
	end
end
