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

ActiveRecord::Schema[7.1].define(version: 2024_05_03_201416) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  # Custom types defined in this database.
  # Note that some types may not work with other database engines. Be careful if changing database.
  create_enum "role_user", ["user", "admin"]

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "enderecos", force: :cascade do |t|
    t.string "logradouro"
    t.integer "numero"
    t.string "complemento"
    t.string "bairro"
    t.string "cidade"
    t.string "estado"
    t.integer "cep"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_enderecos_on_user_id"
  end

  create_table "escalas", force: :cascade do |t|
    t.date "data"
    t.time "hora"
    t.string "nome"
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
  end

  create_table "escalas_musicas", id: false, force: :cascade do |t|
    t.bigint "escala_id"
    t.bigint "musica_id"
    t.index ["escala_id", "musica_id"], name: "index_escalas_musicas_on_escala_id_and_musica_id"
    t.index ["escala_id"], name: "index_escalas_musicas_on_escala_id"
    t.index ["musica_id"], name: "index_escalas_musicas_on_musica_id"
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

  create_table "products", force: :cascade do |t|
    t.string "name", null: false
    t.text "description", null: false
    t.decimal "price", precision: 8, scale: 2, null: false
    t.boolean "publish", default: false, null: false
    t.bigint "category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "promo", default: false
    t.decimal "promo_price", default: "0.0"
    t.index ["category_id"], name: "index_products_on_category_id"
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

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "enderecos", "users"
  add_foreign_key "membros", "ministerios"
  add_foreign_key "membros", "usuarios"
  add_foreign_key "products", "categories"
  add_foreign_key "usuarios", "tipo_skills"
end
