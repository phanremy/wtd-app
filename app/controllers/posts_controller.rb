# frozen_string_literal: true

require "open-uri"

class PostsController < ApplicationController
  load_and_authorize_resource

  before_action :set_post, except: %i[index new create]
  before_action :authenticate_user!, except: %i[index show]

  def index
    @posts = Post.accessible_by(current_ability)
    @events = JSON.parse(URI.parse(paris_api_url).read)['records']
  end

  def show; end

  def edit; end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:success] = 'Post successfully created'
      redirect_to @post
    else
      flash.now[:error] = @post.errors.full_messages
      render_flash
    end
  end

  def update
    if @post.update(post_params)
      flash.now[:success] = 'Post was successfully updated'
      redirect_to @post
    else
      flash.now[:error] = @post.errors.full_messages
      render_flash
    end
  end

  def destroy
    if @post.destroy
      flash[:success] = 'Post was successfully deleted.'
      redirect_to posts_path
    else
      flash.now[:error] = 'Something went wrong'
      render_flash
    end
  end

  private

  def posts_query(posts)
    posts
  end

  def post_params
    params.require(:post).permit(:title, :body, :starting_date,
                                 :ending_date, :address, :link, :user_id)
  end

  def set_post
    @post = Post.find(params[:id])
  end

  # rubocop: disable Metrics/MethodLength
  def paris_api_url
    <<-URL
      https://opendata.paris.fr/api/records/1.0/search/?
      dataset=que-faire-a-paris-&
      q=date_start>='2022-05-26T22:00:00Z'&
      q=date_end>='2022-05-31T22:00:00Z'&
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
