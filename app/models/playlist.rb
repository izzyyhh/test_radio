# frozen_string_literal: true

class Playlist < ApplicationRecord
  belongs_to :server
  has_many :tracks
end
