class LottoPlusDrawDivision < ActiveRecord::Base
  
  belongs_to :draw, :class_name => 'LottoPlusDraw'
  
end
