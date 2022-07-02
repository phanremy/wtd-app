# frozen_string_literal: true

module Posts
  class FiltersController < ApplicationController
    authorize_resource class: false

    before_action :authenticate_user!, except: %i[create]

    def create
    end
  end
end
