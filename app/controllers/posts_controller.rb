# frozen_string_literal: true

require "open-uri"

class PostsController < ApplicationController
  include FilterEvents

  load_and_authorize_resource

  before_action :set_post, except: %i[index new create]
  before_action :authenticate_user!, except: %i[index show]

  def index
    @posts = Post.accessible_by(current_ability)
    @events = filtered_events(title: '',
                              starting_date: '2022-05-26',
                              ending_date: '2022-05-31')
  end

  def show; end

  def edit; end

  def new
    @post = Post.new

    render turbo_stream: turbo_stream.append(
      :main,
      partial: 'shared/modal',
      locals: { content: render_to_string(partial: 'posts/form',
                                          layout: false,
                                          locals: { post: @post }) }
    )
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
end
