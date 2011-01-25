# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

require "csv"

def import_results(model,file)
  all_lotto_draws = CSV.read(file)
  all_lotto_draws.shift # get rid of header titles
  while(!all_lotto_draws.empty?) do
    lotto_draw = all_lotto_draws.shift
    record = model.new(:number => lotto_draw[0],
      :date => Date.parse(lotto_draw[1]),
      :ball1 => lotto_draw[2],
      :ball2 => lotto_draw[3],
      :ball3 => lotto_draw[4],
      :ball4 => lotto_draw[5],
      :ball5 => lotto_draw[6],
      :ball6 => lotto_draw[7],
      :bonus_ball => lotto_draw[8],
      :prize_payable => lotto_draw[23],
      :rollover => lotto_draw[24],
      :rollover_count => lotto_draw[25],
      :next_estimated_jackpot => lotto_draw[26],
      :next_guaranteed_jackpot => lotto_draw[27],
      :total_sales => lotto_draw[28],
      :draw_machine => lotto_draw[29],
      :ball_set => lotto_draw[30])
    (1..7).each do |i|
      record.divisions.build(:number => i, 
        :payout => lotto_draw[8 + i],
        :winners => lotto_draw[15 + i])
    end
    record.save!
  end
end
  
import_results(LottoPlusDraw,"#{Rails.root}\\db\\lotto_plus_draw_results.csv")
import_results(LottoDraw,"#{Rails.root}\\db\\lotto_draw_results.csv")

#Ball.create_balls
#TwoBallCombo.create_combos
#ThreeBallCombo.create_combos