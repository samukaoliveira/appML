require "test_helper"

class TipoSkillsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tipo_skill = tipo_skills(:one)
  end

  test "should get index" do
    get tipo_skills_url
    assert_response :success
  end

  test "should get new" do
    get new_tipo_skill_url
    assert_response :success
  end

  test "should create tipo_skill" do
    assert_difference("TipoSkill.count") do
      post tipo_skills_url, params: { tipo_skill: { nome: @tipo_skill.nome } }
    end

    assert_redirected_to tipo_skill_url(TipoSkill.last)
  end

  test "should show tipo_skill" do
    get tipo_skill_url(@tipo_skill)
    assert_response :success
  end

  test "should get edit" do
    get edit_tipo_skill_url(@tipo_skill)
    assert_response :success
  end

  test "should update tipo_skill" do
    patch tipo_skill_url(@tipo_skill), params: { tipo_skill: { nome: @tipo_skill.nome } }
    assert_redirected_to tipo_skill_url(@tipo_skill)
  end

  test "should destroy tipo_skill" do
    assert_difference("TipoSkill.count", -1) do
      delete tipo_skill_url(@tipo_skill)
    end

    assert_redirected_to tipo_skills_url
  end
end
