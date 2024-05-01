module MusicasHelper

    def carregar_versoes(musica)
        if musica.versao.any?
          musica.versao.map { |versao| versao.link_youtube }.join(', ').html_safe
        else
          'Sem versões disponíveis'
        end
    end
end
