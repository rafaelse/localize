module ApplicationHelper

  def display_quantity(promotion)
    if promotion.unlimited_quantity?
      content_tag(:span, 'quantidade ilimitada', class: 'quantity')
    else
      content_tag(:span, "#{promotion.quantity} restante(s)", class: 'quantity')
    end
  end

  def display_time(promotion)
    if promotion.unlimited_time?
      content_tag(:span, 'por tempo ilimitado', class: 'time')
    else
      content_tag(:span, "até #{promotion.valid_to.strftime('%d/%m/%Y')}", class: 'time')
    end
  end
end
