module Libalyzer
  class BaseService

    def self.call(*args)
      new(*args).call
    end

  end
end
