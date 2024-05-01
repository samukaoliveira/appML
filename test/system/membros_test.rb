require "application_system_test_case"

class MembrosTest < ApplicationSystemTestCase
  setup do
    @membro = membros(:one)
  end

  test "visiting the index" do
    visit membros_url
    assert_selector "h1", text: "Membros"
  end

  test "should create membro" do
    visit membros_url
    click_on "New membro"

    fill_in "Ministerio", with: @membro.ministerio_id
    fill_in "Usuario", with: @membro.usuario_id
    click_on "Create Membro"

    assert_text "Membro was successfully created"
    click_on "Back"
  end

  test "should update Membro" do
    visit membro_url(@membro)
    click_on "Edit this membro", match: :first

    fill_in "Ministerio", with: @membro.ministerio_id
    fill_in "Usuario", with: @membro.usuario_id
    click_on "Update Membro"

    assert_text "Membro was successfully updated"
    click_on "Back"
  end

  test "should destroy Membro" do
    visit membro_url(@membro)
    click_on "Destroy this membro", match: :first

    assert_text "Membro was successfully destroyed"
  end
end
