require 'vertice'

class Grafos
  attr_accessor :vertices

  def initialize
    @vertices=[]
  end

  def agregaVertice(nombre)
    @vertices.append(Vertice.new(nombre))
  end

  def tamanioGrafo()
    return vertices.length
  end

  def agregaArista(verticeOrigen, verticeDestino, longitud)
    desde=@vertices.index{ |v| v.nombre==verticeOrigen}
    hacia=@vertices.index{ |v| v.nombre==verticeDestino}
    @vertices[desde].vecinos[hacia]=TRUE
    @vertices[desde].distancias[hacia]=longitud
    @vertices[hacia].vecinos[desde]=TRUE
    @vertices[hacia].distancias[desde]=longitud
  end

  def imprimeTodoVertice
    @vertices.each do |v|
      puts v.nombre
    end
  end
end
