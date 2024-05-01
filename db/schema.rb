# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_05_01_203105) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  # Custom types defined in this database.
  # Note that some types may not work with other database engines. Be careful if changing database.
  create_enum "role_user", ["user", "admin"]

  create_table "escalas", force: :cascade do |t|
    t.date "data"
    t.time "hora"
    t.string "nome"
    t.bigint "musica_id", null: false
    t.string "baterista"
    t.string "baixista"
    t.string "tecladista"
    t.string "vocalista"
    t.string "vionolista"
    t.string "guitarrista"
    t.string "outros"
    t.string "obs"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["musica_id"], name: "index_escalas_on_musica_id"
  end

  create_table "membros", force: :cascade do |t|
    t.bigint "ministerio_id", null: false
    t.bigint "usuario_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ministerio_id"], name: "index_membros_on_ministerio_id"
    t.index ["usuario_id"], name: "index_membros_on_usuario_id"
  end

  create_table "ministerios", force: :cascade do |t|
    t.integer "lider"
    t.string "nome"
    t.integer "administrador"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "musicas", force: :cascade do |t|
    t.string "nome"
    t.string "interprete"
    t.string "tom_original"
    t.string "ultimo_tom_tocado"
    t.integer "bmp_original"
    t.integer "ultimo_bpm_tocado"
    t.string "obs"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tipo_skills", force: :cascade do |t|
    t.string "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.enum "role", default: "user", null: false, enum_type: "role_user"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "usuarios", force: :cascade do |t|
    t.string "email"
    t.string "nome"
    t.string "role"
    t.bigint "tipo_skill_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tipo_skill_id"], name: "index_usuarios_on_tipo_skill_id"
  end

  create_table "versaos", force: :cascade do |t|
    t.string "nome"
    t.string "link_youtube"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "musica_id"
    t.index ["musica_id"], name: "index_versaos_on_musica_id"
  end

  add_foreign_key "escalas", "musicas"
  add_foreign_key "membros", "ministerios"
  add_foreign_key "membros", "usuarios"
  add_foreign_key "usuarios", "tipo_skills"
end
