# frozen_string_literal: true

require "open-uri"

module Events
  module Filter
    extend ActiveSupport::Concern

    included do # rubocop: disable Metrics/BlockLength
      def filtered_events(tags:, starting_date:, ending_date:, price:)
        url = paris_api_url(tags, starting_date, ending_date, price)
        JSON.parse(URI.parse(url).read)['records']
      end

      private

      # rubocop: disable Metrics/MethodLength
      def paris_api_url(tags, starting_date, ending_date, price)
        <<-URL
          https://opendata.paris.fr/api/records/1.0/search/?
          dataset=que-faire-a-paris-&
          #{starting_date_params(starting_date)}
          #{ending_date_params(ending_date)}
          sort=-date_end&
          facet=date_start&
          facet=date_end&
          facet=tags&
          facet=address_street&
          facet=transport&
          facet=price_type&
          refine.address_city=Paris&
          refine.price_type=#{price}&
          timezone=UTC&
        URL
          .delete("\n").delete(" ")
          .concat(tag_params(tags))
      end
      # rubocop: enable Metrics/MethodLength

      def starting_date_params(date)
        return nil unless date

        "q=date_start>='#{date}T00:00:00Z'&"
      end

      def ending_date_params(date)
        return nil unless date

        "q=date_end>='#{date}T00:00:00Z'&"
      end

      def tag_params(tags)
        return '' if tags.all?(&:blank?)

        tags.reject(&:blank?).map { |tag| "refine.tags=#{tag}&" }.join
      end
    end
  end
end
