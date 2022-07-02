# frozen_string_literal: true

require "open-uri"

module FilterEvents
  extend ActiveSupport::Concern

  included do
    def filtered_events(title:, starting_date:, ending_date:)
      url = paris_api_url(title, starting_date, ending_date)
      JSON.parse(URI.parse(url).read)['records']
    end

    private

    # rubocop: disable Metrics/MethodLength
    def paris_api_url(title, starting_date, ending_date)
      <<-URL
        https://opendata.paris.fr/api/records/1.0/search/?
        dataset=que-faire-a-paris-&
        q=date_start>='#{starting_date}T22:00:00Z'&
        q=date_end>='#{ending_date}T22:00:00Z'&
        sort=-date_start&
        facet=date_start&
        facet=date_end&
        facet=tags&
        facet=address_street&
        facet=transport&
        facet=price_type&
        refine.address_city=Paris&
        refine.price_type=gratuit&
        timezone=Europe/Paris&
      URL
        .delete("\n").delete(" ")
    end
    # rubocop: enable Metrics/MethodLength
  end
end
