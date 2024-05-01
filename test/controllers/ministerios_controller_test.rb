require "test_helper"

class MinisteriosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ministerio = ministerios(:one)
  end

  test "should get index" do
    get ministerios_url
    assert_response :success
  end

  test "should get new" do
    get new_ministerio_url
    assert_response :success
  end

  test "should create ministerio" do
    assert_difference("Ministerio.count") do
      post ministerios_url, params: { ministerio: { administrador: @ministerio.administrador, lider: @ministerio.lider, membro: @ministerio.membro, nome: @ministerio.nome } }
    end

    assert_redirected_to ministerio_url(Ministerio.last)
  end

  test "should show ministerio" do
    get ministerio_url(@ministerio)
    assert_response :success
  end

  test "should get edit" do
    get edit_ministerio_url(@ministerio)
    assert_response :success
  end

  test "should update ministerio" do
    patch ministerio_url(@ministerio), params: { ministerio: { administrador: @ministerio.administrador, lider: @ministerio.lider, membro: @ministerio.membro, nome: @ministerio.nome } }
    assert_redirected_to ministerio_url(@ministerio)
  end

  test "should destroy ministerio" do
    assert_difference("Ministerio.count", -1) do
      delete ministerio_url(@ministerio)
    end

    assert_redirected_to ministerios_url
  end
end
