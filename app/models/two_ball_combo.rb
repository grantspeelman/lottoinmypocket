class TwoBallCombo < ActiveRecord::Base

  validates_uniqueness_of :ball2, :scope => :ball1

  before_save :update_lotto_draw_count

  def lotto_draws
    LottoDraw.ball(ball1).ball(ball2)
  end

  def self.create_combos
    generate_combinations(2,(1..49).to_a) do |x,y|
      find_or_create_by_ball1_and_ball2(x,y)
    end
  end

  def self.hot_lotto_draw_combo
    set = []
    while(set.size < 6)
      c = where('ball1 NOT IN (?) AND ball2 NOT IN (?)',set + [0],set + [0]).
          order('lotto_draw_count DESC, random()').first
      set += [c.ball1,c.ball2]
    end
    set
  end

  def self.cold_lotto_draw_combo
    set = []
    while(set.size < 6)
      c = where('ball1 NOT IN (?) AND ball2 NOT IN (?)',set + [0],set + [0]).
          order('lotto_draw_count ASC, random()').first
      set += [c.ball1,c.ball2]
    end
    set
  end

  protected

  def update_lotto_draw_count
    self.lotto_draw_count = lotto_draws.count
  end

end
