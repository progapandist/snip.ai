class Snippet < ApplicationRecord
  extend FriendlyId

  belongs_to :prompt, optional: true

  friendly_id :text, use: :slugged
end
