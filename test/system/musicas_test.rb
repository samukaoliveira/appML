require "application_system_test_case"

class MusicasTest < ApplicationSystemTestCase
  setup do
    @musica = musicas(:one)
  end

  test "visiting the index" do
    visit musicas_url
    assert_selector "h1", text: "Musicas"
  end

  test "should create musica" do
    visit musicas_url
    click_on "New musica"

    fill_in "Bmp original", with: @musica.bmp_original
    fill_in "Interprete", with: @musica.interprete
    fill_in "Nome", with: @musica.nome
    fill_in "Obs", with: @musica.obs
    fill_in "Tom original", with: @musica.tom_original
    fill_in "Ultimo bpm tocado", with: @musica.ultimo_bpm_tocado
    fill_in "Ultimo tom tocado", with: @musica.ultimo_tom_tocado
    fill_in "Versao", with: @musica.versao_id
    click_on "Create Musica"

    assert_text "Musica was successfully created"
    click_on "Back"
  end

  test "should update Musica" do
    visit musica_url(@musica)
    click_on "Edit this musica", match: :first

    fill_in "Bmp original", with: @musica.bmp_original
    fill_in "Interprete", with: @musica.interprete
    fill_in "Nome", with: @musica.nome
    fill_in "Obs", with: @musica.obs
    fill_in "Tom original", with: @musica.tom_original
    fill_in "Ultimo bpm tocado", with: @musica.ultimo_bpm_tocado
    fill_in "Ultimo tom tocado", with: @musica.ultimo_tom_tocado
    fill_in "Versao", with: @musica.versao_id
    click_on "Update Musica"

    assert_text "Musica was successfully updated"
    click_on "Back"
  end

  test "should destroy Musica" do
    visit musica_url(@musica)
    click_on "Destroy this musica", match: :first

    assert_text "Musica was successfully destroyed"
  end
end
