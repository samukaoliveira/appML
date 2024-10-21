class TipoSkillsController < ApplicationController
  before_action :set_tipo_skill, only: %i[ show edit update destroy ]

  # GET /tipo_skills or /tipo_skills.json
  def index
    @tipo_skills = TipoSkill.all
  end

  # GET /tipo_skills/1 or /tipo_skills/1.json
  def show
    @usuarios_skills = TipoSkillsUsuario.where(tipo_skill_id: @tipo_skill)
    @usuarios_skill = @usuarios_skills.map do |usuario|
      usuario = Usuario.find(usuario.usuario_id)
      { usuario_id: usuario.id, nome: usuario.nome.presence || "-" }
    end
  end

  def carrega_nome_usuarios(id)
    Usuario.find(id).nome
  end

  # GET /tipo_skills/new
  def new
    @tipo_skill = TipoSkill.new
  end

  # GET /tipo_skills/1/edit
  def edit
  end

  # POST /tipo_skills or /tipo_skills.json
  def create
    @tipo_skill = TipoSkill.new(tipo_skill_params)

    respond_to do |format|
      if @tipo_skill.save
        format.html { redirect_to tipo_skill_url(@tipo_skill), notice: "Tipo skill criada com sucesso." }
        format.json { render :show, status: :created, location: @tipo_skill }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tipo_skill.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tipo_skills/1 or /tipo_skills/1.json
  def update
    respond_to do |format|
      if @tipo_skill.update(tipo_skill_params)
        format.html { redirect_to tipo_skill_url(@tipo_skill), notice: "Tipo skill atualizada com sucesso." }
        format.json { render :show, status: :ok, location: @tipo_skill }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tipo_skill.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipo_skills/1 or /tipo_skills/1.json
  def destroy
    @tipo_skill.destroy!

    respond_to do |format|
      format.html { redirect_to tipo_skills_url, notice: "Tipo skill deletada com sucesso." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipo_skill
      @tipo_skill = TipoSkill.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tipo_skill_params
      params.require(:tipo_skill).permit(:nome)
    end
end
