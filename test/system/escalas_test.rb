require "application_system_test_case"

class EscalasTest < ApplicationSystemTestCase
  setup do
    @escala = escalas(:one)
  end

  test "visiting the index" do
    visit escalas_url
    assert_selector "h1", text: "Escalas"
  end

  test "should create escala" do
    visit escalas_url
    click_on "New escala"

    fill_in "Baixista", with: @escala.baixista
    fill_in "Baterista", with: @escala.baterista
    fill_in "Data", with: @escala.data
    fill_in "Guitarrista", with: @escala.guitarrista
    fill_in "Hora", with: @escala.hora
    fill_in "Musica", with: @escala.musica_id
    fill_in "Nome", with: @escala.nome
    fill_in "Obs", with: @escala.obs
    fill_in "Outros", with: @escala.outros
    fill_in "Tecladista", with: @escala.tecladista
    fill_in "Violonista", with: @escala.violonista
    fill_in "Vocalista", with: @escala.vocalista
    click_on "Create Escala"

    assert_text "Escala was successfully created"
    click_on "Back"
  end

  test "should update Escala" do
    visit escala_url(@escala)
    click_on "Edit this escala", match: :first

    fill_in "Baixista", with: @escala.baixista
    fill_in "Baterista", with: @escala.baterista
    fill_in "Data", with: @escala.data
    fill_in "Guitarrista", with: @escala.guitarrista
    fill_in "Hora", with: @escala.hora
    fill_in "Musica", with: @escala.musica_id
    fill_in "Nome", with: @escala.nome
    fill_in "Obs", with: @escala.obs
    fill_in "Outros", with: @escala.outros
    fill_in "Tecladista", with: @escala.tecladista
    fill_in "Violonista", with: @escala.violonista
    fill_in "Vocalista", with: @escala.vocalista
    click_on "Update Escala"

    assert_text "Escala was successfully updated"
    click_on "Back"
  end

  test "should destroy Escala" do
    visit escala_url(@escala)
    click_on "Destroy this escala", match: :first

    assert_text "Escala was successfully destroyed"
  end
end
