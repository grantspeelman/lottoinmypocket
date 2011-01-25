class CreateLottoPlusDraws < ActiveRecord::Migration
  def self.up
    create_table 'lotto_plus_draws' do |t|
      t.integer 'number', :null => false
      t.date 'date', :null => false
      t.integer 'ball1', :null => false
      t.integer 'ball2', :null => false
      t.integer 'ball3', :null => false
      t.integer 'ball4', :null => false
      t.integer 'ball5', :null => false
      t.integer 'ball6', :null => false
      t.integer 'bonus_ball', :null => false
      t.integer 'prize_payable', :null => false
      t.integer 'rollover', :null => false
      t.integer 'rollover_count', :null => false
      t.integer 'next_estimated_jackpot', :null => false
      t.integer 'next_guaranteed_jackpot', :null => false
      t.integer 'total_sales', :null => false
      t.string 'draw_machine', :null => false
      t.string 'ball_set', :null => false
    end
  end

  def self.down
    drop_table :lotto_plus_draws
  end
end
