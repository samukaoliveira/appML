# app/decorators/musicas_collection_decorator.rb
class MusicasCollectionDecorator
    include Enumerable
  
    def initialize(musicas)
      @musicas = musicas
    end
  
    def each(&block)
      @musicas.each do |musica|
        yield MusicasDecorator.new(musica)
      end
    end
  end
  