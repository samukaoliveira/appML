require "test_helper"

class EscalasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @escala = escalas(:one)
  end

  test "should get index" do
    get escalas_url
    assert_response :success
  end

  test "should get new" do
    get new_escala_url
    assert_response :success
  end

  test "should create escala" do
    assert_difference("Escala.count") do
      post escalas_url, params: { escala: { baixista: @escala.baixista, baterista: @escala.baterista, data: @escala.data, guitarrista: @escala.guitarrista, hora: @escala.hora, musica_id: @escala.musica_id, nome: @escala.nome, obs: @escala.obs, outros: @escala.outros, tecladista: @escala.tecladista, violonista: @escala.violonista, vocalista: @escala.vocalista } }
    end

    assert_redirected_to escala_url(Escala.last)
  end

  test "should show escala" do
    get escala_url(@escala)
    assert_response :success
  end

  test "should get edit" do
    get edit_escala_url(@escala)
    assert_response :success
  end

  test "should update escala" do
    patch escala_url(@escala), params: { escala: { baixista: @escala.baixista, baterista: @escala.baterista, data: @escala.data, guitarrista: @escala.guitarrista, hora: @escala.hora, musica_id: @escala.musica_id, nome: @escala.nome, obs: @escala.obs, outros: @escala.outros, tecladista: @escala.tecladista, violonista: @escala.violonista, vocalista: @escala.vocalista } }
    assert_redirected_to escala_url(@escala)
  end

  test "should destroy escala" do
    assert_difference("Escala.count", -1) do
      delete escala_url(@escala)
    end

    assert_redirected_to escalas_url
  end
end
