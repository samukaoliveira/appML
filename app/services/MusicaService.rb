class MusicaService

    def initialize(nome = nil)
        @nome = nome
    end

    def busca_musicas
        return Musica.all unless @nome.present?
        Musica.where("nome ILIKE ? OR interprete ILIKE ?", "%#{@nome}%", "%#{@nome}%")
    end

end