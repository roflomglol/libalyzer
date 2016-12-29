require 'csv'

module Libalyzer
  module Reports
    class ParseItunesLibrary < BaseService

      def initialize(csv_raw)
        @csv_raw = csv_raw
      end

      def call
        csv.each_with_object(Hash.new(0)) do |row, report|
          genre_name = row.first

          genre = catch(:genre) do
            throw(:genre, genre_name) if GENRES.has_key?(genre_name)

            GENRES.each do |genre, subgenres|
              throw(:genre, genre) if subgenres.include?(genre_name)
            end

            genre_name
          end

          report[genre] += 1
        end
      end

      private

      attr_reader :csv_raw

      def csv
        @csv ||= CSV.parse(csv_raw, col_sep: "\t", quote_char: '|')
      end
    end
  end
end
