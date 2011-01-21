class CreateTwoBallCombos < ActiveRecord::Migration
  def self.up
    create_table :two_ball_combos do |t|
      t.integer 'ball1', :null => false
      t.integer 'ball2', :null => false
      t.integer 'lotto_draw_count', :default => 0, :null => false
    end
  end

  def self.down
    drop_table :two_ball_combos
  end
end
