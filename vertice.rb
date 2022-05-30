#Cada vértice tendrá un nombre (número o cadena), una lista de adyacentes
#y una lista de distancias a esos adyacentes
class Vertice
  attr_accessor :nombre, :adyacentes, :distancias

  def initialize(nombre)
    @nombre=nombre
    @adyacentes=[]
    @distancias=[]
  end

  def imprime_nombre
    puts "#{@nombre}"
  end
end
