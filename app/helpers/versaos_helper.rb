module VersaosHelper

    def nome_da_musica(id)
        musica = Musica.find(id)
        musica.nome
    end
end
