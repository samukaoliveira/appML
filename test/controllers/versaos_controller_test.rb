require "test_helper"

class VersaosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @versao = versaos(:one)
  end

  test "should get index" do
    get versaos_url
    assert_response :success
  end

  test "should get new" do
    get new_versao_url
    assert_response :success
  end

  test "should create versao" do
    assert_difference("Versao.count") do
      post versaos_url, params: { versao: { link_youtube: @versao.link_youtube, nome: @versao.nome } }
    end

    assert_redirected_to versao_url(Versao.last)
  end

  test "should show versao" do
    get versao_url(@versao)
    assert_response :success
  end

  test "should get edit" do
    get edit_versao_url(@versao)
    assert_response :success
  end

  test "should update versao" do
    patch versao_url(@versao), params: { versao: { link_youtube: @versao.link_youtube, nome: @versao.nome } }
    assert_redirected_to versao_url(@versao)
  end

  test "should destroy versao" do
    assert_difference("Versao.count", -1) do
      delete versao_url(@versao)
    end

    assert_redirected_to versaos_url
  end
end
