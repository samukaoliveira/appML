module VersaosHelper

    def nome_da_musica(id)
        musica = Musica.find(id)
        musica.nome
    end

    def versao_da_musica(musica_id)
        versao = Versao.where(musica_id: musica_id)
        versao.nome
    end

    def versao_da_musica_escala(musica_id, versao_id)
        versao = Versao.where(musica_id: musica_id, id: versao_id).first
        versao&.nome
    end

    def link_versao_da_musica_escala(musica_id, versao_id)
        versao = Versao.where(musica_id: musica_id, id: versao_id).first
        versao&.link_youtube
    end
end
