module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]

      def rating(array)
        international_films_with_rating = array.select do |film|
          rating = film['rating_kinopoisk']
          country = film['country']
          countries = country.nil? ? [] : country.split(',')

          has_positive_rating = !rating.nil? && rating != '0'
          has_positive_rating && countries.length > 1
        end

        sum_of_ratings = international_films_with_rating.reduce(0) do |sum, film|
          rating = film['rating_kinopoisk'].to_f
          sum + rating
        end

        sum_of_ratings / international_films_with_rating.length
      end

      def chars_count(films, threshold)
        filtered_by_rating = films.select do |film|
          rating = film['rating_kinopoisk']

          !rating.nil? && rating.to_f > threshold
        end

        filtered_by_rating.reduce(0) do |count, film|
          count + film['name'].count('и')
        end
      end
    end
  end
end
