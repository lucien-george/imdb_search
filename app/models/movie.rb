class Movie < ApplicationRecord
  belongs_to :director
  # include PgSearch::Model

  # # Movie.search_by_title_and_syllabus('...')
  # pg_search_scope :search_by_title_and_syllabus,
  #                 against: [:title, :syllabus],
  #                 using: {
  #                   tsearch: { prefix: true } # <-- now `superman batm` will return something!
  #                 }

  # # Movie.global_search('...')
  # pg_search_scope :global_search,
  #   against: [:title, :syllabus],
  #   associated_against: {
  #     director: [:first_name, :last_name]
  #   },
  #   using: {
  #     tsearch: { prefix: true }
  #   }
  # multisearchable against: [:title, :syllabus]

  # ElasticSearch
  searchkick
end
