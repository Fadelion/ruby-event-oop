# lignes très pratiques qui appellent les gems du Gemfile. On verra plus tard comment s'en servir ;) - ça évite juste les "require" partout
require 'bundler'
require 'pry'
Bundler.require

# lignes qui appellent les fichiers lib/user.rb et lib/event.rb
# comme ça, tu peux faire User.new dans ce fichier d'application. Top.
require_relative 'lib/user'
require_relative 'lib/event'

# Exemple d'utilisation
# USER
julie = User.new("julie@email.com", 17)
#puts julie.to_s
user1 = User.find_by_email("julie@email.com")
puts user1.to_s
puts user1.age
#binding.pry
# EVENT
print("----------Evènement----------\n")
event = Event.new("2025-05-05 23:01", 120, "Réunion", ["Alice@gmail.com", "Bob@yahoo.fr"])
puts event.to_s
#event.postpone_24h
puts event.postpone_24h
puts event.to_s
puts event.is_soon?

# Maintenant c'est open bar pour tester ton application. Tous les fichiers importants sont chargés
# Tu peux faire User.new, Event.new, binding.pry, User.all, etc.