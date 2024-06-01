class MusicasController < ApplicationController
  before_action :set_musica, only: %i[ show edit update destroy ]

  # GET /musicas or /musicas.json
  def index
    @musicas = MusicasCollectionDecorator.new(Musica.all)
  end

  # GET /musicas/1 or /musicas/1.json
  def show
  end

  # GET /musicas/new
  def new
    @musica = Musica.new
  end

  # GET /musicas/1/edit
  def edit
  end

  # POST /musicas or /musicas.json
  def create
    @musica = Musica.new(musica_params)

    respond_to do |format|
      if @musica.save
        format.html { redirect_to musica_url(@musica), notice: "Musica was successfully created." }
        format.json { render :show, status: :created, location: @musica }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @musica.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /musicas/1 or /musicas/1.json
  def update
    respond_to do |format|
      if @musica.update(musica_params)
        format.html { redirect_to musica_url(@musica), notice: "Musica was successfully updated." }
        format.json { render :show, status: :ok, location: @musica }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @musica.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /musicas/1 or /musicas/1.json
  def destroy
    @musica.destroy!

    respond_to do |format|
      format.html { redirect_to musicas_url, notice: "Musica was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_musica
      @musica = MusicasDecorator.new(Musica.find(params[:id]))
    end

    # Only allow a list of trusted parameters through.
    def musica_params
      params.require(:musica).permit(:nome, :interprete, :tom_original, :ultimo_tom_tocado, :bmp_original, :ultimo_bpm_tocado, :obs, :versao_id)
    end
end
