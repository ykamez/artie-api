module Concerns
  module Paging
    extend ActiveSupport::Concern

    def has_next?(data, limit)
      data.size == limit
    end
  end
end
