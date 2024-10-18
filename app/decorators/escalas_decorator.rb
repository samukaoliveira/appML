# app/decorators/musica_decorator.rb
class EscalasDecorator < SimpleDelegator
    def initialize(escala)
      @escala = escala
      super(escala)
    end
  
    def baterista
      __getobj__.baterista.presence || "-"
    end

    def baixista
        __getobj__.baixista.presence || "-"
    end

    def tecladista
    __getobj__.tecladista.presence || "-"
    end

    def vocalistas
    __getobj__.vocalistas.presence || "-"
    end

    def violonista
    __getobj__.violonista.presence || "-"
    end

    def guitarrista
    __getobj__.guitarrista.presence || "-"
    end

    def outros
    __getobj__.outros.presence || "-"
    end

    def obs
    __getobj__.obs.presence || "-"
    end

    def musicas
      return __getobj__.musicas if __getobj__.musicas.present? && __getobj__.musicas.any?
      []    
    end
  
    # Adicione outros métodos para os atributos que você quer decorar
    def method_missing(method, *args, &block)
      value = __getobj__.send(method, *args, &block)
      value.presence || "-" 
    end
  
    def respond_to_missing?(method, include_private = false)
      __getobj__.respond_to?(method, include_private) || super
    end
  end
  