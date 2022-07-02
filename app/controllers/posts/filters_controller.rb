# frozen_string_literal: true

module Posts
  class FiltersController < ApplicationController
    include FilterEvents
    authorize_resource class: false

    before_action :authenticate_user!, except: %i[create]

    def create
      @posts = Post.all

      @events = if dates_valid?
                  filtered_events(title: '',
                                  starting_date: starting_date.strftime('%Y-%m-%d'),
                                  ending_date: ending_date.strftime('%Y-%m-%d'))
                else
                  []
                end

      render turbo_stream: turbo_stream.update('posts', partial: 'posts/posts',
                                                        locals: { posts: @posts,
                                                                  events: @events })
    end

    private

    def dates_valid?
      return false unless params_present?

      ending_date >= starting_date &&
        starting_date > Time.zone.today - 1.day
    end

    def params_present?
      params[:starting_date].present? && params[:ending_date].present?
    end

    def starting_date
      params[:starting_date].to_date
    end

    def ending_date
      params[:ending_date].to_date
    end
  end
end
