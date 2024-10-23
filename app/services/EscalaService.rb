class EscalaService

    def initialize(nome = nil)
        @nome = nome
    end

    def busca_escalas
        return Escala.all unless @nome.present?
        Escala.where("nome ILIKE ? OR data::text ILIKE ?", "%#{@nome}%", "%#{@nome}%")
    end

end