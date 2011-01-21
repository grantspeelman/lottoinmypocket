class LottoDraw < ActiveRecord::Base
  default_scope :order => 'number DESC'
  
  validates_uniqueness_of :number
  validates_uniqueness_of :date

  has_many :divisions, :class_name => 'LottoDrawDivision'
  scope :ball, lambda { |ball|
    where("ball1 = :ball OR ball2 = :ball OR ball3 = :ball OR ball4 = :ball OR ball5 = :ball OR ball6 = :ball", {:ball => ball})
  }
  scope :recent, where('date >= ?',25.weeks.ago).order('date DESC')

  def ball_numbers
    [ball1,ball2,ball3,ball4,ball5,ball6]
  end

  def get_combinations(r)
    generate_combinations(r,ball_numbers)
  end

  def self.import_results(file = "#{Rails.root}\\db\\lotto_draw_results.csv")
    require "csv"
    all_lotto_draws = CSV.read(file)
    all_lotto_draws.shift # get rid of header titles
    while(!all_lotto_draws.empty?) do
      lotto_draw = all_lotto_draws.shift
      record = new(:number => lotto_draw[0],
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

end
