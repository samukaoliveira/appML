module EscalasHelper

    def nome_musico(id)
        @user_nome = Usuario.find_by(id: id.to_i)
        return @user_nome.nome unless id.nil?
        " --- "
    end

    def opcoes_de_baterista
        Usuario.includes(:tipo_skill).where(tipo_skill: { nome: "Bateria" } ).map { | bat | [ bat.nome, bat.id ]}
    end

    def opcoes_de_musica
        Musica.all
    end

    def opcoes_de_versao(id)
        return Versao.where(musica_id: id.to_i) unless id.nil?
        "Nenhuma versão encontrada"
    end

    def opcoes_de_baixista
        Usuario.includes(:tipo_skill).where(tipo_skill: { nome: "Baixo" } ).map { | bat | [ bat.nome, bat.id ]}
    end

    def opcoes_de_guitarrista
        Usuario.includes(:tipo_skill).where(tipo_skill: { nome: "Guitarra" } ).map { | bat | [ bat.nome, bat.id ]}
    end

    def opcoes_de_tecladista
        Usuario.includes(:tipo_skill).where(tipo_skill: { nome: "Teclado" } ).map { | bat | [ bat.nome, bat.id ]}
    end

    def opcoes_de_vocalista
        Usuario.includes(:tipo_skill).where(tipo_skill: { nome: "Voz" } ).map { | bat | [ bat.nome, bat.id ]}
    end

    def opcoes_de_percussao
        Usuario.includes(:tipo_skill).where(tipo_skill: { nome: "Percussao" } ).map { | bat | [ bat.nome, bat.id ]}
    end

    def opcoes_de_violonista
        Usuario.includes(:tipo_skill).where(tipo_skill: { nome: "Violao" } ).map { | bat | [ bat.nome, bat.id ]}
    end

    def opcoes_de_sax
        Usuario.includes(:tipo_skill).where(tipo_skill: { nome: "Sax" } ).map { | bat | [ bat.nome, bat.id ]}
    end
end
