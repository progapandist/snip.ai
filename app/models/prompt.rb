class Prompt < ApplicationRecord
  extend FriendlyId
  include PgSearch::Model

  has_one :snippet
  friendly_id :text, use: :slugged

  # TODO: Check if I need to keep it or switch to Elastic
  pg_search_scope :similarity_like,
    against: :text,
    using: {
      trigram: {
        word_similarity: true,
        threshold: 0.5
      }
    }

  pg_search_scope :word_similarity_like,
    against: :text,
    using: {
      trigram: {
        threshold: 0.5
      }
    }
end
