require_relative 'grafos'

grafo=Grafos.new

grafo.agrega_vertice("Lima")
grafo.agrega_vertice("Ica")
grafo.agrega_vertice("Arequipa")
grafo.agrega_vertice("Huanuco")
grafo.agrega_vertice("Huancayo")
grafo.agrega_vertice("Chimbote")

grafo.imprime_todo_vertice

puts "Se encuentra Lima: #{grafo.se_encuentra_vertice("Lima")}"
puts "Se encuentra Puno: #{grafo.se_encuentra_vertice("Puno")}"

grafo.agrega_arista("Lima", "Chimbote", 320)
grafo.agrega_arista("Lima", "Arequipa", 587)
grafo.agrega_arista("Ica", "Arequipa", 460)
grafo.agrega_arista("Arequipa", "Huanuco", 460)
grafo.agrega_arista("Huanuco", "Huancayo", 268)

puts "Lista de adyacentes de Lima"
print (grafo.vertices[0].adyacentes), "\n"
puts "Lista de distancias de Lima"
print (grafo.vertices[0].distancias),"\n"

puts "Es el grafo un árbol libre? #{grafo.es_arbol_libre}"


grafo.elimina_arista("Lima", "Chimbote")
puts "\nLista de adyacentes de Lima"
print (grafo.vertices[0].adyacentes), "\n"
puts "Lista de distancias de Lima"
print (grafo.vertices[0].distancias),"\n"

puts "Se encuentra arista Lima-Chimbote: #{grafo.se_encuentra_arista("Lima", "Chimbote")}"
puts "Se encuentra arista Lima-Puno: #{grafo.se_encuentra_arista("Lima", "Puno")}"
puts "Se encuentra arista Lima-Arequipa: #{grafo.se_encuentra_arista("Lima", "Arequipa")}"

