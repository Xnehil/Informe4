require_relative 'grafos'

grafo=Grafos.new

grafo.agrega_vertice("Lima")
grafo.agrega_vertice("Ica")
grafo.agrega_vertice("Arequipa")
grafo.agrega_vertice("Huanuco")
grafo.agrega_vertice("Huancayo")

grafo.imprime_todo_vertice

puts "Se encuentra Lima: #{grafo.se_encuentra_vertice("Lima")}"
puts "Se encuentra Puno: #{grafo.se_encuentra_vertice("Puno")}"

grafo.agrega_arista("Lima", "Huanuco", 320)
grafo.agrega_arista("Lima", "Arequipa", 587)
grafo.agrega_arista("Lima", "Ica", 127)
grafo.agrega_arista("Ica", "Arequipa", 460)
grafo.agrega_arista("Ica", "Huanuco", 360)
grafo.agrega_arista("Arequipa", "Huancayo", 460)
grafo.agrega_arista("Huancayo", "Lima", 268)
grafo.agrega_arista("Huancayo", "Ica", 212)

adyacentesLima=grafo.devuelve_adyacentes("Lima")
puts "Lista de adyacentes de Lima"
print (adyacentesLima),"\n"

puts "Se encuentra arista Lima-Huanuco: #{grafo.se_encuentra_arista("Lima", "Huanuco")}"
puts "Se encuentra arista Lima-Puno: #{grafo.se_encuentra_arista("Lima", "Puno")}"