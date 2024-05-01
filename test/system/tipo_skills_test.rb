require "application_system_test_case"

class TipoSkillsTest < ApplicationSystemTestCase
  setup do
    @tipo_skill = tipo_skills(:one)
  end

  test "visiting the index" do
    visit tipo_skills_url
    assert_selector "h1", text: "Tipo skills"
  end

  test "should create tipo skill" do
    visit tipo_skills_url
    click_on "New tipo skill"

    fill_in "Nome", with: @tipo_skill.nome
    click_on "Create Tipo skill"

    assert_text "Tipo skill was successfully created"
    click_on "Back"
  end

  test "should update Tipo skill" do
    visit tipo_skill_url(@tipo_skill)
    click_on "Edit this tipo skill", match: :first

    fill_in "Nome", with: @tipo_skill.nome
    click_on "Update Tipo skill"

    assert_text "Tipo skill was successfully updated"
    click_on "Back"
  end

  test "should destroy Tipo skill" do
    visit tipo_skill_url(@tipo_skill)
    click_on "Destroy this tipo skill", match: :first

    assert_text "Tipo skill was successfully destroyed"
  end
end
