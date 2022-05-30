require_relative 'vertice'

class Grafos
  attr_accessor :vertices

  def initialize
    @vertices=[]
    @num_aristas=0
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
        @vertices[desde].adyacentes.append(vertice_destino)
        @vertices[desde].distancias.append(longitud)
        @vertices[hacia].adyacentes.append(vertice_origen)
        @vertices[hacia].distancias.append(longitud)
        @num_aristas+=1
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
        v.adyacentes.each do |vecino|
          return true if vecino==vertice_destino
        end
      end
    end
    return false
  end

  def devuelve_adyacentes(nombre_vertice)
    vertices.each do |v|
      return v.adyacentes if v.nombre==nombre_vertice
    end
  end

  def elimina_arista(vertice_origen, vertice_destino)
    if se_encuentra_arista(vertice_origen, vertice_destino)
      desde=@vertices.index{ |v| v.nombre==vertice_origen}
      hacia=@vertices[desde].adyacentes.index{ |v| v==vertice_destino}
      @vertices[desde].adyacentes.delete_at(hacia)
      @vertices[desde].distancias.delete_at(hacia)
      desde=@vertices.index{ |v| v.nombre==vertice_destino}
      hacia=@vertices[desde].adyacentes.index{ |v| v==vertice_origen}
      @vertices[desde].adyacentes.delete_at(hacia)
      @vertices[desde].distancias.delete_at(hacia)
      @num_aristas-=1
    end
  end

  def depth_first_search(vertice_origen)
    vertices_visitados=0
    pila_a_visitar=[]
    lista_visitados=[]
    pila_a_visitar.push(vertice_origen)
    while pila_a_visitar.any? do
      vertice_actual=pila_a_visitar.pop
      vertices_visitados+=1
      lista_visitados.unshift(vertice_actual)
      adyacentes_actual=self.devuelve_adyacentes(vertice_actual)
      adyacentes_actual.each do |v|
        if !lista_visitados.include?(v)
          pila_a_visitar.push(v)
        end
      end
    end
    return vertices_visitados
  end

  def conexo?
    vertices_recorridos=self.depth_first_search(@vertices[0].nombre)
    return vertices_recorridos==self.tamanioGrafo
  end

  def es_arbol_libre
    return self.conexo? && @num_aristas==self.tamanioGrafo-1
  end
end

