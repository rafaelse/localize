module ApplicationHelper

  def display_quantity(promotion)
    if promotion.unlimited_quantity?
      content_tag(:span, 'unlimited quantity', class: 'quantity')
    else
      content_tag(:span, "#{promotion.quantity} left", class: 'quantity')
    end
  end

  def display_time(promotion)
    if promotion.unlimited_time?
      content_tag(:span, 'for unlimited time', class: 'time')
    else
      content_tag(:span, "until #{promotion.valid_to.strftime('%b, %d %Y')}", class: 'time')
    end
  end
end
