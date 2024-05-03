class EscalasController < ApplicationController
  before_action :set_escala, only: %i[ show edit update destroy ]

  # GET /escalas or /escalas.json
  def index
    @escalas = Escala.all
  end

  # GET /escalas/1 or /escalas/1.json
  def show
  end

  # GET /escalas/new
  def new
    @escala = Escala.new
  end

  # GET /escalas/1/edit
  def edit
  end

  # POST /escalas or /escalas.json
  def create
    @escala = Escala.new(escala_params)
    processar_musicas(params[:musica1], params[:musica2], params[:musica3])

    respond_to do |format|
      if @escala.save
        format.html { redirect_to escala_url(@escala), notice: "Escala was successfully created." }
        format.json { render :show, status: :created, location: @escala }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @escala.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /escalas/1 or /escalas/1.json
  def update
    respond_to do |format|
      if @escala.update(escala_params)
        processar_musicas(@escala, escala_params)
        format.html { redirect_to escala_url(@escala), notice: "Escala was successfully updated." }
        format.json { render :show, status: :ok, location: @escala }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @escala.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /escalas/1 or /escalas/1.json
  def destroy
    @escala.destroy!

    respond_to do |format|
      format.html { redirect_to escalas_url, notice: "Escala was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_escala
      @escala = Escala.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def escala_params
      params.require(:escala).permit(:data, :hora, :nome, :baterista, :baixista, :vocalista, :guitarrista, :outros, :obs, :musica1, :musica2, :musica3)
    end
    

    def processar_musicas(musica1, musica2, musica3)
      @escala.musicas << Musica.find(musica1) if musica1.present?
      @escala.musicas << Musica.find(musica2) if musica2.present?
      @escala.musicas << Musica.find(musica3) if musica3.present?
    end
end
