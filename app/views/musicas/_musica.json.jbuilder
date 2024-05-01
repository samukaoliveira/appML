json.extract! musica, :id, :nome, :interprete, :tom_original, :ultimo_tom_tocado, :bmp_original, :ultimo_bpm_tocado, :obs, :versao_id, :created_at, :updated_at
json.url musica_url(musica, format: :json)
