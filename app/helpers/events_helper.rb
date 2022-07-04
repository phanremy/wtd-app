# frozen_string_literal: true

module EventsHelper
  TAG_OPTIONS =
    [
      ['', ''],
      ['Art contemporain', 'Art+contemporain'],
      %w[Atelier Atelier],
      %w[BD BD],
      %w[Balade Balade],
      %w[Brocante Brocante],
      %w[Cinéma Cinema],
      %w[Cirque Cirque],
      %w[Clubbing Clubbing],
      %w[Concert Concert],
      %w[Conférence Conference],
      %w[Danse Danse],
      %w[Enfants Enfants],
      %w[Expo Expo],
      %w[Gourmand Gourmand],
      %w[Histoire Histoire],
      %w[Humour Humour],
      %w[Innovation Innovation],
      ['Jeux 2024', 'Jeux+2024'],
      %w[LGBT LGBT],
      %w[Littérature Littérature],
      %w[Loisirs Loisirs],
      %w[Musique Musique],
      %w[Nature Nature],
      %w[Peinture Peinture],
      %w[Photo Photo],
      %w[Salon Salon],
      %w[Sciences Sciences],
      %w[Solidarités Solidarites],
      ['Spectacle musical', 'Spectacle+musical'],
      %w[Sport Sport],
      %w[Street-art Street-art],
      %w[Théâtre Theatre]
    ].freeze

  def parse_tags(string)
    return [] unless string

    string.gsub(' ', ' ').split(';')
  end

  def tag_options
    TAG_OPTIONS
  end
end
