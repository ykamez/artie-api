module Concerns
  module Paging
    extend ActiveSupport::Concern

    def has_next?(data, limit)
      data.size == limit.to_i
    end
  end
end
