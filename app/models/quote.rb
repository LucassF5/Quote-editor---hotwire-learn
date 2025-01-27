class Quote < ApplicationRecord
  belongs_to :company

  validates :name, presence: true

  scope :ordered, -> { order(id: :desc) }

  # after_create_commit  -> { broadcast_prepend_later_to "quotes" }
  # after_update_commit  -> { broadcast_replace_later_to "quotes" }
  # after_destroy_commit -> { broadcast_remove_to "quotes" }

  # The above callbacks can be replaced with the following:
  broadcast_to ->(quote) { "quotes" }, insert_bt: :prepend
end
