module CharactersHelper
  def sort_link(column:, label:)
    link_to(label, characters_path(column: column))
  end
end
