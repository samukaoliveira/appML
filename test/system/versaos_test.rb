require "application_system_test_case"

class VersaosTest < ApplicationSystemTestCase
  setup do
    @versao = versaos(:one)
  end

  test "visiting the index" do
    visit versaos_url
    assert_selector "h1", text: "Versaos"
  end

  test "should create versao" do
    visit versaos_url
    click_on "New versao"

    fill_in "Link youtube", with: @versao.link_youtube
    fill_in "Nome", with: @versao.nome
    click_on "Create Versao"

    assert_text "Versao was successfully created"
    click_on "Back"
  end

  test "should update Versao" do
    visit versao_url(@versao)
    click_on "Edit this versao", match: :first

    fill_in "Link youtube", with: @versao.link_youtube
    fill_in "Nome", with: @versao.nome
    click_on "Update Versao"

    assert_text "Versao was successfully updated"
    click_on "Back"
  end

  test "should destroy Versao" do
    visit versao_url(@versao)
    click_on "Destroy this versao", match: :first

    assert_text "Versao was successfully destroyed"
  end
end
