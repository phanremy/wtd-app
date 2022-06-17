# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user

  validates :title, :body, :address, :starting_date, :ending_date, presence: true
end
