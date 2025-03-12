# frozen_string_literal: true

# :nodoc:
class List < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
  has_many :movies, through: :bookmarks
  has_one_attached :photo

  validates :name, presence: true, uniqueness: true
  # validates :image_url, presence: true
end
