class Search < ApplicationRecord

  belongs_to :query, touch: true

end
