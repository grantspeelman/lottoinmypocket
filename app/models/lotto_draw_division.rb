class LottoDrawDivision < ActiveRecord::Base

  belongs_to :draw, :class_name => 'LottoDraw'

end
