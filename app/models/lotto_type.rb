# To change this template, choose Tools | Templates
# and open the template in the editor.

module LottoType
  def ball_numbers
    [ball1,ball2,ball3,ball4,ball5,ball6]
  end

  def get_combinations(r)
    generate_combinations(r,ball_numbers)
  end
end
