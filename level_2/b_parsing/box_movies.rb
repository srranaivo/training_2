# Programme qui retourne les films (un certain nombre number passé en paramètre)
# sortis avant l’année max_year et avec les recettes enregistrées earnings.
# Contrainte : la liste retournée doit être un array de films.
# Chaque film doit être représenté par un hash avec les clés name, year
# et earnings. Exemple: { name: "Avatar", year: 2009, earnings: 760505847 }

# on définit une fonction qui va parser le fichier CSV
# pour obtenir un array
def parse_movies(file_path, max_year)
  filepath = "lib/movies.csv"
  movies = []
  CSV.foreach(filepath) do |row|
  # Here, row is an array of columns
  # on définit la variable year pour obtenir la colonne year qu'on transforme
  # en integer
    year = row[1].to_i
    if year < max_year
      movies << { name: row[0], year: year, earnings: row[2].to_i }
    end
  end
  movies
end

def most_successful(number, max_year, file_path)
  # on prend le fichier parsé et on le définit dans une vairable
  all_movies = parse_movies(file_path, max_year)
  # on renvoie les n films ayant le meilleur earning
  all_movies.max_by(number) { |movie| movie[:earnings]}
end
