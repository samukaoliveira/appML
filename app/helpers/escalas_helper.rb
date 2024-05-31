module EscalasHelper

    def nome_musico(id)
        @user_nome = Usuario.find_by(id: id.to_i)
        return @user_nome.nome unless id.nil?
        " --- "
    end

    def opcoes_de_baterista
        Usuario.where(tipo_skill: { nome: "Bateria" }).map { |usuario| [usuario.nome, usuario.id] }
      end
      

    def opcoes_de_musica
        Musica.all
    end

    def opcoes_de_versao(id)
        return Versao.where(musica_id: id.to_i) unless id.nil?
        "Nenhuma versão encontrada"
    end

    def opcoes_de_baixista
        Usuario.joins(:tipo_skills).where(tipo_skills: { nome: "Baixo" } ).map { | bat | [ bat.nome, bat.id ]}
    end

    def opcoes_de_guitarrista
        Usuario.joins(:tipo_skills).where(tipo_skills: { nome: "Guitarra" } ).map { | bat | [ bat.nome, bat.id ]}
    end

    def opcoes_de_tecladista
        Usuario.joins(:tipo_skills).where(tipo_skills: { nome: "Teclado" } ).map { | bat | [ bat.nome, bat.id ]}
    end

    def opcoes_de_vocalista
        Usuario.joins(:tipo_skills).where(tipo_skills: { nome: "Voz" } ).map { | bat | [ bat.nome, bat.id ]}
    end

    def opcoes_de_percussao
        Usuario.joins(:tipo_skills).where(tipo_skills: { nome: "Percussao" } ).map { | bat | [ bat.nome, bat.id ]}
    end

    def opcoes_de_violonista
        Usuario.joins(:tipo_skills).where(tipo_skills: { nome: "Violão" } ).map { | bat | [ bat.nome, bat.id ]}
    end

    def opcoes_de_sax
        Usuario.joins(:tipo_skills).where(tipo_skills: { nome: "Sax" } ).map { | bat | [ bat.nome, bat.id ]}
    end
end
