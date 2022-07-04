# frozen_string_literal: true

require "open-uri"

module Events
  module Filter
    extend ActiveSupport::Concern

    included do
      def filtered_events(tags:, starting_date:, ending_date:)
        url = paris_api_url(tags, starting_date, ending_date)
        JSON.parse(URI.parse(url).read)['records']
      end

      private

      # rubocop: disable Metrics/MethodLength
      def paris_api_url(tags, starting_date, ending_date)
        <<-URL
          https://opendata.paris.fr/api/records/1.0/search/?
          dataset=que-faire-a-paris-&
          q=date_start>='#{starting_date}T00:00:00Z'&
          q=date_end>='#{ending_date}T00:00:00Z'&
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
          .concat(tag_params(tags))
      end
      # rubocop: enable Metrics/MethodLength

      def tag_params(tags)
        return '' if tags.all?(&:blank?)

        tags.reject(&:blank?).map { |tag| "refine.tags=#{tag}&" }.join
      end
    end
  end
end