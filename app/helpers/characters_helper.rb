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
    when 'asc' then tag.i(class: "bi bi-arrow-up-short")
    when 'desc' then tag.i(class: "bi bi-arrow-down-short")
    end
  end

  def sort_arrow_for(column)
    sort_arrow if params[:column] == column
  end
end
