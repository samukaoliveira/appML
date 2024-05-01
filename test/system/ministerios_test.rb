require "application_system_test_case"

class MinisteriosTest < ApplicationSystemTestCase
  setup do
    @ministerio = ministerios(:one)
  end

  test "visiting the index" do
    visit ministerios_url
    assert_selector "h1", text: "Ministerios"
  end

  test "should create ministerio" do
    visit ministerios_url
    click_on "New ministerio"

    fill_in "Administrador", with: @ministerio.administrador
    fill_in "Lider", with: @ministerio.lider
    fill_in "Membro", with: @ministerio.membro
    fill_in "Nome", with: @ministerio.nome
    click_on "Create Ministerio"

    assert_text "Ministerio was successfully created"
    click_on "Back"
  end

  test "should update Ministerio" do
    visit ministerio_url(@ministerio)
    click_on "Edit this ministerio", match: :first

    fill_in "Administrador", with: @ministerio.administrador
    fill_in "Lider", with: @ministerio.lider
    fill_in "Membro", with: @ministerio.membro
    fill_in "Nome", with: @ministerio.nome
    click_on "Update Ministerio"

    assert_text "Ministerio was successfully updated"
    click_on "Back"
  end

  test "should destroy Ministerio" do
    visit ministerio_url(@ministerio)
    click_on "Destroy this ministerio", match: :first

    assert_text "Ministerio was successfully destroyed"
  end
end
