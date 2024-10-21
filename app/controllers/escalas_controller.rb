class EscalasController < ApplicationController
  before_action :set_escala, only: %i[ show edit update destroy ]
  before_action :set_escala_edit, only: %i[ edit ]

  # GET /escalas or /escalas.json
  def index
    @escalas = EscalasCollectionDecorator.new(Escala.all)
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
    @musicas_associadas = @escala.musicas.pluck(:id)
  end

  # POST /escalas or /escalas.json
  def create
    @escala = Escala.new(escala_params)
    processar_musicas(params[:musica1], params[:musica2], params[:musica3])

    respond_to do |format|
      if @escala.save
        @escala.musicas << Musica.find(params[:musica_ids]) if params[:musica_ids].present?
      
        format.html { redirect_to escala_url(@escala), notice: "Escala criada com sucesso." }
        format.json { render :show, status: :created, location: @escala }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @escala.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /escalas/1 or /escalas/1.json
  def update
    @escala = Escala.find(params[:id])
    
    respond_to do |format|
      if @escala.update(escala_params)
        # Atualizar as associações músicas e versões
        update_associations
        
        format.html { redirect_to @escala, notice: 'Escala atualizada com sucesso.' }
        format.json { render :show, status: :ok, location: @escala }
      else
        format.html { render :edit }
        format.json { render json: @escala.errors, status: :unprocessable_entity }
      end
    end
  end
  

  # DELETE /escalas/1 or /escalas/1.json
  def destroy
    @escala.destroy!

    respond_to do |format|
      format.html { redirect_to escalas_url, notice: "Escala deletada com sucesso." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_escala
      @escala = EscalasDecorator.new(Escala.find(params[:id]))
    end

    def set_escala_edit
      @escala = Escala.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def escala_params
      # Aceita os três IDs de música separadamente e os agrupa em um array
      params.require(:escala).permit(:data, :hora, :nome, :baterista, :baixista, :tecladista, :vocalista, :violonista, :guitarrista, :outros, :obs, :musica1_id, :musica2_id, :musica3_id, :musica1_versao, :musica2_versao, :musica3_versao).tap do |whitelisted|
        whitelisted[:musica_ids] = [whitelisted.delete(:musica1_id), whitelisted.delete(:musica2_id), whitelisted.delete(:musica3_id)].compact
      end
    end

    # def escala_params
    #   params.require(:escala).permit(
    #     :data,
    #     :hora,
    #     :nome,
    #     :outros,
    #     :obs,
    #     :baterista,
    #     :baixista,
    #     :tecladista,
    #     :vocalista,
    #     :violonista,
    #     :guitarrista,
    #     escalas_musicas_attributes: [:id, :musica_id, :versao_id, :_destroy]
    #   )
    # end


    def update_associations
      # Percorrer os parâmetros de escalas_musicas_attributes e atualizar as associações
      if escala_params[:escalas_musicas_attributes].present?
        escala_params[:escalas_musicas_attributes].each do |attributes|
          if attributes[:id].present?
            # Atualizar associação existente se tiver ID
            escala_musica = @escala.escalas_musicas.find(attributes[:id])
            escala_musica.update(musica_id: attributes[:musica_id], versao_id: attributes[:versao_id])
          else
            # Criar nova associação se não tiver ID
            @escala.escalas_musicas.create(musica_id: attributes[:musica_id], versao_id: attributes[:versao_id])
          end
        end
      end
    end
    
    

    def processar_musicas(musica1, musica2, musica3)
      @escala.musicas << Musica.find(musica1) if musica1.present?
      @escala.musicas << Musica.find(musica2) if musica2.present?
      @escala.musicas << Musica.find(musica3) if musica3.present?
    end
end
