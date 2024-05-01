module UsuariosHelper

    def opcoes_de_skills
        TipoSkill.all.map { | skill | [ skill.nome, skill.id ] }
    end
end
