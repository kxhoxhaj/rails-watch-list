class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list

  validates_length_of :comment, minimum: 6, allow_blank: false
  validates :movie_id, uniqueness: { scope: :list_id }
end
