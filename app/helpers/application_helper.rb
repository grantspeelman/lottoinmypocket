module ApplicationHelper

  def display_date(date)
    date
  end

  def ball_span(number)
    content_tag :span, number.to_s, :class => "ball-#{number}"
  end

end
