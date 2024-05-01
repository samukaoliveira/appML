require "test_helper"

class MusicasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @musica = musicas(:one)
  end

  test "should get index" do
    get musicas_url
    assert_response :success
  end

  test "should get new" do
    get new_musica_url
    assert_response :success
  end

  test "should create musica" do
    assert_difference("Musica.count") do
      post musicas_url, params: { musica: { bmp_original: @musica.bmp_original, interprete: @musica.interprete, nome: @musica.nome, obs: @musica.obs, tom_original: @musica.tom_original, ultimo_bpm_tocado: @musica.ultimo_bpm_tocado, ultimo_tom_tocado: @musica.ultimo_tom_tocado, versao_id: @musica.versao_id } }
    end

    assert_redirected_to musica_url(Musica.last)
  end

  test "should show musica" do
    get musica_url(@musica)
    assert_response :success
  end

  test "should get edit" do
    get edit_musica_url(@musica)
    assert_response :success
  end

  test "should update musica" do
    patch musica_url(@musica), params: { musica: { bmp_original: @musica.bmp_original, interprete: @musica.interprete, nome: @musica.nome, obs: @musica.obs, tom_original: @musica.tom_original, ultimo_bpm_tocado: @musica.ultimo_bpm_tocado, ultimo_tom_tocado: @musica.ultimo_tom_tocado, versao_id: @musica.versao_id } }
    assert_redirected_to musica_url(@musica)
  end

  test "should destroy musica" do
    assert_difference("Musica.count", -1) do
      delete musica_url(@musica)
    end

    assert_redirected_to musicas_url
  end
end
