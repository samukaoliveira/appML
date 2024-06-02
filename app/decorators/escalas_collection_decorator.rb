# app/decorators/musicas_collection_decorator.rb
class EscalasCollectionDecorator
    include Enumerable
  
    def initialize(escalas)
      @escalas = escalas
    end
  
    def each(&block)
      @escalas.each do |escala|
        yield EscalasDecorator.new(escala)
      end
    end
  end
  