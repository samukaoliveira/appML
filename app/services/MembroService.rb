class MembroService

    def initialize(nome = nil)
        @nome = nome
    end

    def busca_membros
        return Membro.all unless @nome.present?
        Membro.where("membros.id IN (SELECT m.id from membros AS m INNER JOIN usuarios AS u ON u.id = m.usuario_id WHERE u.nome ILIKE ?)", "%#{@nome}%")
    end

end