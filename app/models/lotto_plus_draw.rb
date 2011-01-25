class LottoPlusDraw < ActiveRecord::Base
  include LottoType
  default_scope :order => 'number DESC'
  
  validates_uniqueness_of :number
  validates_uniqueness_of :date
  
  has_many :divisions, :class_name => 'LottoPlusDrawDivision'
  
  scope :ball, lambda { |ball|
    where("ball1 = :ball OR ball2 = :ball OR ball3 = :ball OR ball4 = :ball OR ball5 = :ball OR ball6 = :ball", {:ball => ball})
  }
  scope :recent, where('date >= ?',25.weeks.ago).order('date DESC')
  
  
end
