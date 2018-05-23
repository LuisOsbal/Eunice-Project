class Advertisement < ApplicationRecord
  belongs_to :user
  scope :find_advertisement_title, ->(name) {
    return unless name.present?
    where('unaccent(title) ILIKE  unaccent(?) ', "%#{name}%")
  }
end
