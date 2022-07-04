# frozen_string_literal: true

module Posts
  class FiltersController < ApplicationController
    include Events::Filter
    authorize_resource class: false

    before_action :authenticate_user!, except: %i[create]

    def create
      @posts = Post.all

      @events = []
      if params[:starting_date].present?
        @events = filtered_events(tags: tags,
                                  starting_date: starting_date.strftime('%Y-%m-%d'),
                                  ending_date: ending_date.strftime('%Y-%m-%d'))
      end

      render turbo_stream: turbo_stream.update('posts', partial: 'posts/posts',
                                                        locals: { posts: @posts,
                                                                  events: @events })
    end

    private

    def starting_date
      params[:starting_date].to_date
    end

    def ending_date
      params[:ending_date]&.to_date || starting_date
    end

    def tags
      params[:tags].is_a?(Array) ? params[:tags] : Array(params[:tags])
    end
  end
end
