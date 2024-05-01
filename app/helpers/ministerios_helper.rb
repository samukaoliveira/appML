module MinisteriosHelper

    def opcoes_de_lider
        Usuario.all.map { | lider | [ lider.nome, lider.id ] }
    end

    def carregar_membros(ministerio)
        if ministerio.membro.any?
            ministerio.membro.map { |membro| membro.nome }.join(', ').html_safe
        else
          'Não há membros Cadastrados disponíveis'
        end
    end
end
