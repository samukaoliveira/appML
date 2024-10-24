
class MembrosController < ApplicationController
  before_action :set_membro, only: %i[ show edit update destroy ]
  before_action :authenticate_usuario!
  before_action :set_ministerio_usuario_atual

  # GET /membros or /membros.json
  def index
    @membros = MembroService.new(params[:nome]).busca_membros
  end

  # GET /membros/1 or /membros/1.json
  def show

  end

  # GET /membros/new
  def new
    @membro = Membro.new
    # pry
    @membro.ministerio_id = @ministerio_id
  end

  # GET /membros/1/edit
  def edit
  end

  # POST /membros or /membros.json
  def create
    @membro = Membro.new(membro_params)

    respond_to do |format|
      if @membro.save
        format.html { redirect_to membro_url(@membro), notice: "Membro criado com sucesso." }
        format.json { render :show, status: :created, location: @membro }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @membro.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /membros/1 or /membros/1.json
  def update
    respond_to do |format|
      if @membro.update(membro_params)
        format.html { redirect_to membro_url(@membro), notice: "Membro atualizado com sucesso." }
        format.json { render :show, status: :ok, location: @membro }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @membro.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /membros/1 or /membros/1.json
  def destroy
    @membro.destroy!

    respond_to do |format|
      format.html { redirect_to membros_url, notice: "Membro deletado com sucesso." }
      format.json { head :no_content }
    end
  end

  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_membro
      @membro = Membro.find(params[:id])
    end

    def set_ministerio_usuario_atual
      return @ministerio_id = current_usuario.ministerios.ids.first unless current_usuario.ministerios.ids.empty?
      nenhum_ministerio_cadastrado
    end

    def nenhum_ministerio_cadastrado
      respond_to do |format|
          format.html { redirect_to home_path, alert: "Você não está associado a nenhum ministerio. Contate o administrador." }
      end
    end

    # Only allow a list of trusted parameters through.
    def membro_params
      params.require(:membro).permit(:ministerio_id, :usuario_id)
    end
end
