module CharactersHelper
  # def sort_link(column:, label:)
  #   link_to(label, characters_path(column: column))
  # end

  # def sort_link(column:, label:)
  #   direction = column == params[:column] ? future_direction : 'asc'
  #   link_to(label, characters_path(column: column, direction: direction))
  # end

  # def future_direction = params[:direction] == 'asc' ? 'desc' : 'asc'

  # def sort_link(column:, label:)
  #   link_to(label, characters_path(column: column), data: { turbo_action: 'replace' })
  # end

  def sort_link(column:, label:)
    direction = column == params[:column] ? future_direction : 'asc'
    link_to(label, characters_path(column: column, direction: direction), data: { turbo_action: 'replace' })
  end

  def future_direction = params[:direction] == 'asc' ? 'desc' : 'asc'

  def sort_arrow
    case params[:direction]
    when 'asc' then tag.i(class: "bi bi-arrow-up")
    when 'desc' then tag.i(class: "bi bi-arrow-down")
    else tag.i(class: "bi bi-arrow-down-up")
    end
  end

  def sort_arrow_for(column)
    params[:column] == column ? sort_arrow : tag.i(class: "bi bi-arrow-down-up")
  end
end
