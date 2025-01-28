class Quote < ApplicationRecord
  belongs_to :company

  validates :name, presence: true

  scope :ordered, -> { order(id: :desc) }

  # after_create_commit  -> { broadcast_prepend_later_to "quotes" }
  # after_update_commit  -> { broadcast_replace_later_to "quotes" }
  # after_destroy_commit -> { broadcast_remove_to "quotes" }

  # The above callbacks can be replaced with the following:
  broadcasts_to ->(quote) { [ quote.company, "quotes" ] }, inserts_by: :prepend
  # To broadcast to multiple streams, you must pass an array of streams
  # Users who share broadcastings should have the lambda return an array with the same values.
  # Users who shouldn't share broadcastings should have the lambda return an array with different values.
end
