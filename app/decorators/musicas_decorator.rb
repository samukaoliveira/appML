# app/decorators/musica_decorator.rb
class MusicasDecorator < SimpleDelegator
    def initialize(musica)
      super(musica)
    end
  
    def tom_original
      __getobj__.tom_original.presence || "-"
    end

    def ultimo_tom_tocado
        __getobj__.ultimo_tom_tocado.presence || "-"
    end

    def bmp_original
    __getobj__.bmp_original.presence || "-"
    end

    def ultimo_bpm_tocado
    __getobj__.ultimo_bpm_tocado.presence || "-"
    end
  
    def ignored_methods
      [:errors, :any?, :full_messages]
    end

    def method_missing(method, *args, &block)
      if ignored_methods.include?(method)
        __getobj__.send(method, *args, &block)
      else
        value = __getobj__.send(method, *args, &block)
        value.presence || "-"
      end
    end
  
    def respond_to_missing?(method, include_private = false)
      __getobj__.respond_to?(method, include_private) || super
    end
  end
  