class Ball < ActiveRecord::Base

  validates_uniqueness_of :ball

  before_save :update_lotto_draw_count

  def lotto_draws
    LottoDraw.ball(ball)
  end

  def self.create_balls
    (1..49).each do |number|
      find_or_create_by_ball(number)
    end
  end

  def self.hot_lotto_draw_combo
    set = []
    while(set.size < 6)
      set << where('ball NOT in (?)',set + [0]).
             order('lotto_draw_count DESC, random()').first.ball
    end
    set
  end

  def self.cold_lotto_draw_combo
    set = []
    while(set.size < 6)
      set << where('ball NOT in (?)',set + [0]).
             order('lotto_draw_count ASC, random()').first.ball
    end
    set
  end

  protected

  def update_lotto_draw_count
    self.lotto_draw_count = lotto_draws.count
  end

end
