class Search < ApplicationRecord

  validates :term, presence: true

  def self.past_searches
    group(:term).count
  end
end
