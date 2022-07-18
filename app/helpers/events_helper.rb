# frozen_string_literal: true

module EventsHelper
  TAG_OPTIONS =
    [
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

  PRICE_OPTIONS =
    [
      %w[gratuit gratuit],
      ['gratuit sous condition', 'gratuit+sous+condition'],
      %w[payant payant]
    ].freeze

  def parse_tags(string)
    return [] unless string

    string.gsub(' ', ' ').split(';')
  end

  def tag_options
    options_for_select(TAG_OPTIONS, [])
  end

  def price_options
    options_for_select(PRICE_OPTIONS, TAG_OPTIONS.first)
  end

  def create_google_calendar_link(title, starting_date, ending_date, body, address)
    "https://calendar.google.com/calendar/u/0/r/eventedit?" \
      "#{"text=#{CGI.escape(title)}" if title}" \
      "&dates=#{CGI.escape((starting_date.to_datetime - 1.hour).strftime('%Y%m%dT%H%M%S'))}/" \
      "#{CGI.escape((ending_date.to_datetime - 1.hour).strftime('%Y%m%dT%H%M%S'))}" \
      "&ctz=#{Rails.application.config.time_zone}" \
      "#{"&details=#{CGI.escape(body)}" if body}" \
      "#{"&location=#{CGI.escape(address)}" if address}"
  end
end
