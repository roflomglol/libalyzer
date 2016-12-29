module Libalyzer
  module Reports
    class Create < BaseService

      def initialize(params)
        @raw    = params[:raw]
      end

      def call
        @report = Report.create(raw:  raw,
                                body: ParseItunesLibrary.call(raw))
      end

      private

      attr_reader :raw
    end
  end
end
