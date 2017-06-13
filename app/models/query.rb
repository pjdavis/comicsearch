class Query < ApplicationRecord

  has_many :searches

  def self.past_searches(sort)
    self
    .left_joins(:searches)
    .group(:id)
    .order(sort_by(sort))
  end

  private

  def self.sort_by(sort)
    case sort
    when 'date'
      'updated_at DESC'
    when 'term'
      'term'
    when 'count'
      'COUNT(searches.id) DESC'
    end
  end

end
