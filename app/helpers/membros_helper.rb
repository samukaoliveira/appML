module MembrosHelper

    def id_do_ministerio(id)
        ministerio = Ministerio.find(id)
        ministerio.nome
    end

    def opcoes_de_membro
        cadidatos_a_membros = Usuario.where.not(id: usuarios_que_sao_membros)
        membros = cadidatos_a_membros.all.map { |m| [m.nome, m.id] }
    end

    def usuarios_que_sao_membros
        Usuario.joins(:ministerios).pluck(:id)
    end

    def skills_membro(membro)
        @usuario = Usuario.find_by(id: membro.id)
        @usuario_skills = @usuario.tipo_skills
    end
      
end
