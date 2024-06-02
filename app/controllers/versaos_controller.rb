class VersaosController < ApplicationController
  before_action :set_versao, only: %i[ show edit update destroy ]

  # GET /versaos or /versaos.json
  def index
    @versaos = Versao.all
  end


  def carregar_versoes_musica(musica_id)
    @versoes = Versao.where(musica_id: musica_id)
  end

  # GET /versaos/1 or /versaos/1.json
  def show
  end

  # GET /versaos/new
  def new
    @versao = Versao.new
  end

  # GET /versaos/1/edit
  def edit
  end

  # POST /versaos or /versaos.json
  def create
    @versao = Versao.new(versao_params)

    respond_to do |format|
      if @versao.save
        format.html { redirect_to musica_url(@versao.musica_id), notice: "Versao was successfully created." }
        format.json { render :show, status: :created, location: @versao }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @versao.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /versaos/1 or /versaos/1.json
  def update
    respond_to do |format|
      if @versao.update(versao_params)
        format.html { redirect_to versao_url(@versao), notice: "Versao was successfully updated." }
        format.json { render :show, status: :ok, location: @versao }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @versao.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /versaos/1 or /versaos/1.json
  def destroy
    @versao.destroy!

    respond_to do |format|
      format.html { redirect_to versaos_url, notice: "Versao was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_versao
      @versao = Versao.find(params[:id])
    end


    # Only allow a list of trusted parameters through.
    def versao_params
      params.require(:versao).permit(:nome, :link_youtube, :musica_id)
    end
end
