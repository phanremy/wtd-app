# frozen_string_literal: true

module EventsHelper
  def parse_tags(string)
    return [] unless string

    string.gsub(' ', ' ').split(';')
  end

  def tag_options
    [
      ['', ''],
      ['Art contemporain', 'Art+contemporain'],
      ['Atelier', 'Atelier'],
      ['BD', 'BD'],
      ['Balade', 'Balade'],
      ['Brocante', 'Brocante'],
      ['Cinéma', 'Cinema'],
      ['Cirque', 'Cirque'],
      ['Clubbing', 'Clubbing'],
      ['Concert', 'Concert'],
      ['Conférence', 'Conference'],
      ['Danse', 'Danse'],
      ['Enfants', 'Enfants'],
      ['Expo', 'Expo'],
      ['Gourmand', 'Gourmand'],
      ['Histoire', 'Histoire'],
      ['Humour', 'Humour'],
      ['Innovation', 'Innovation'],
      ['Jeux 2024', 'Jeux+2024'],
      ['LGBT', 'LGBT'],
      ['Littérature', 'Littérature'],
      ['Loisirs', 'Loisirs'],
      ['Musique', 'Musique'],
      ['Nature', 'Nature'],
      ['Peinture', 'Peinture'],
      ['Photo', 'Photo'],
      ['Salon', 'Salon'],
      ['Sciences', 'Sciences'],
      ['Solidarités', 'Solidarites'],
      ['Spectacle musical', 'Spectacle+musical'],
      ['Sport', 'Sport'],
      ['Street-art', 'Street-art'],
      ['Théâtre', 'Theatre']
    ]
  end
end
