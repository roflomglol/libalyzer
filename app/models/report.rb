class Report < ApplicationRecord
  BASE_GENRES = %i(
   Electronic
   Dance
   Pop
   R&B/Soul
   Hip-Hop/Rap
   Classical
   Jazz
   Blues
   Rock
   Alternative
   Soundtrack
   Reggae
  ).freeze

  def base_genres_as_json
    BASE_GENRES.map do |genre_name|
      { axis: genre_name, value: body[genre_name.to_s] || 0 }
    end.to_json
  end
end
