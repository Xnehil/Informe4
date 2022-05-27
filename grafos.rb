require_relative 'vertice'

class Grafos
  attr_accessor :vertices

  def initialize
    @vertices=[]
  end

  def agrega_vertice(nombre)
    if !se_encuentra_vertice(nombre)
      @vertices.append(Vertice.new(nombre))
    end
  end

  def tamanioGrafo()
    return vertices.length
  end

  def agrega_arista(vertice_origen, vertice_destino, longitud)
    if !se_encuentra_vertice(vertice_origen) || !se_encuentra_vertice(vertice_destino)
      puts "Error. No se encontro alguno de los vertices"
    else
      if !se_encuentra_arista(vertice_origen, vertice_destino)
        desde=@vertices.index{ |v| v.nombre==vertice_origen}
        hacia=@vertices.index{ |v| v.nombre==vertice_destino}
        @vertices[desde].vecinos.append(vertice_destino)
        @vertices[desde].distancias[hacia]=longitud
        @vertices[hacia].vecinos.append(vertice_origen)
        @vertices[hacia].distancias[desde]=longitud
      end
    end
  end

  def imprime_todo_vertice
    @vertices.each do |v|
      v.imprime_nombre
    end
  end

  def se_encuentra_vertice(nombre_vertice)
    vertices.each do |v|
      return true if v.nombre==nombre_vertice
    end
    return false
  end

  def se_encuentra_arista(vertice_origen, vertice_destino)
    vertices.each do |v|
      if v.nombre==vertice_origen
        v.vecinos.each do |vecino|
          return true if vecino==vertice_destino
        end
      end
    end
    return false
  end

  def devuelve_adyacentes(nombre_vertice)
    vertices.each do |v|
      return v.vecinos if v.nombre==nombre_vertice
    end
  end

  def elimina_arista

  end

end

