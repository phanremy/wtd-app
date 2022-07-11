# frozen_string_literal: true

module Posts
  class FiltersController < ApplicationController
    include Events::Filter
    authorize_resource class: false

    before_action :authenticate_user!, except: %i[create]

    def create
      @posts = Post.all

      @events = []
      @events = filtered_events(tags: tags, price: params[:price],
                                starting_date: starting_date,
                                ending_date: ending_date)

      render turbo_stream: turbo_stream.update('posts', partial: 'posts/posts',
                                                        locals: { posts: @posts,
                                                                  events: @events })
    end

    private

    def starting_date
      return nil if params[:starting_date].blank?

      params[:starting_date].to_date.strftime('%Y-%m-%d')
    end

    def ending_date
      return nil if params[:ending_date].blank?

      params[:ending_date].to_date.strftime('%Y-%m-%d')
    end

    def tags
      params[:tags].is_a?(Array) ? params[:tags] : Array(params[:tags])
    end
  end
end
