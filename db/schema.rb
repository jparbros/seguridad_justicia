# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130718145837) do

  create_table "admins", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.integer  "site_id"
    t.boolean  "super_admin"
  end

  add_index "admins", ["email"], :name => "index_admins_on_email", :unique => true
  add_index "admins", ["reset_password_token"], :name => "index_admins_on_reset_password_token", :unique => true

  create_table "answers", :force => true do |t|
    t.string   "url"
    t.integer  "candidate_id"
    t.integer  "question_id"
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
    t.integer  "votes_count",  :default => 0
  end

  create_table "banners", :force => true do |t|
    t.boolean  "active"
    t.integer  "position"
    t.string   "image"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "site_id"
    t.string   "link"
  end

  create_table "blacklists", :force => true do |t|
    t.string   "word"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "blog_comments", :force => true do |t|
    t.integer  "post_id",                         :null => false
    t.string   "author",                          :null => false
    t.string   "email",                           :null => false
    t.text     "content"
    t.boolean  "is_published", :default => false, :null => false
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  add_index "blog_comments", ["post_id", "created_at"], :name => "index_blog_comments_on_post_id_and_created_at"
  add_index "blog_comments", ["post_id", "is_published", "created_at"], :name => "index_blog_comments_on_post_published_created"

  create_table "blog_posts", :force => true do |t|
    t.string   "title",                                          :null => false
    t.string   "slug",                                           :null => false
    t.text     "content"
    t.string   "excerpt",      :limit => 1024
    t.string   "author"
    t.integer  "year",                                           :null => false
    t.integer  "month",                                          :null => false
    t.boolean  "is_published",                 :default => true, :null => false
    t.datetime "published_at",                                   :null => false
    t.datetime "created_at",                                     :null => false
    t.datetime "updated_at",                                     :null => false
  end

  add_index "blog_posts", ["created_at"], :name => "index_blog_posts_on_created_at"
  add_index "blog_posts", ["is_published", "created_at"], :name => "index_blog_posts_on_is_published_and_created_at"
  add_index "blog_posts", ["is_published", "year", "month", "slug"], :name => "index_blog_posts_on_published_year_month_slug"

  create_table "blog_taggings", :force => true do |t|
    t.integer "post_id", :null => false
    t.integer "tag_id",  :null => false
  end

  add_index "blog_taggings", ["post_id", "tag_id"], :name => "index_blog_taggings_on_post_tag", :unique => true

  create_table "blog_tags", :force => true do |t|
    t.string  "name",                              :null => false
    t.boolean "is_category",    :default => false, :null => false
    t.integer "taggings_count", :default => 0,     :null => false
  end

  add_index "blog_tags", ["name", "taggings_count"], :name => "index_blog_tags_on_name_and_taggings_count", :unique => true
  add_index "blog_tags", ["taggings_count"], :name => "index_blog_tags_on_taggings_count"

  create_table "candidates", :force => true do |t|
    t.string   "name"
    t.string   "image"
    t.string   "logo"
    t.integer  "site_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.integer  "political_party_id"
    t.integer  "election_id"
  end

  create_table "cms_blocks", :force => true do |t|
    t.integer  "page_id",    :null => false
    t.string   "identifier", :null => false
    t.text     "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "cms_blocks", ["page_id", "identifier"], :name => "index_cms_blocks_on_page_id_and_identifier"

  create_table "cms_categories", :force => true do |t|
    t.integer "site_id",          :null => false
    t.string  "label",            :null => false
    t.string  "categorized_type", :null => false
  end

  add_index "cms_categories", ["site_id", "categorized_type", "label"], :name => "index_cms_categories_on_site_id_and_categorized_type_and_label", :unique => true

  create_table "cms_categorizations", :force => true do |t|
    t.integer "category_id",      :null => false
    t.string  "categorized_type", :null => false
    t.integer "categorized_id",   :null => false
  end

  add_index "cms_categorizations", ["category_id", "categorized_type", "categorized_id"], :name => "index_cms_categorizations_on_cat_id_and_catd_type_and_catd_id", :unique => true

  create_table "cms_files", :force => true do |t|
    t.integer  "site_id",                                              :null => false
    t.integer  "block_id"
    t.string   "label",                                                :null => false
    t.string   "file_file_name",                                       :null => false
    t.string   "file_content_type",                                    :null => false
    t.integer  "file_file_size",                                       :null => false
    t.string   "description",       :limit => 2048
    t.integer  "position",                          :default => 0,     :null => false
    t.datetime "created_at",                                           :null => false
    t.datetime "updated_at",                                           :null => false
    t.boolean  "archived",                          :default => false
  end

  add_index "cms_files", ["site_id", "block_id"], :name => "index_cms_files_on_site_id_and_block_id"
  add_index "cms_files", ["site_id", "file_file_name"], :name => "index_cms_files_on_site_id_and_file_file_name"
  add_index "cms_files", ["site_id", "label"], :name => "index_cms_files_on_site_id_and_label"
  add_index "cms_files", ["site_id", "position"], :name => "index_cms_files_on_site_id_and_position"

  create_table "cms_layouts", :force => true do |t|
    t.integer  "site_id",                       :null => false
    t.integer  "parent_id"
    t.string   "app_layout"
    t.string   "label",                         :null => false
    t.string   "identifier",                    :null => false
    t.text     "content"
    t.text     "css"
    t.text     "js"
    t.integer  "position",   :default => 0,     :null => false
    t.boolean  "is_shared",  :default => false, :null => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  add_index "cms_layouts", ["parent_id", "position"], :name => "index_cms_layouts_on_parent_id_and_position"
  add_index "cms_layouts", ["site_id", "identifier"], :name => "index_cms_layouts_on_site_id_and_identifier", :unique => true

  create_table "cms_pages", :force => true do |t|
    t.integer  "site_id",                           :null => false
    t.integer  "layout_id"
    t.integer  "parent_id"
    t.integer  "target_page_id"
    t.string   "label",                             :null => false
    t.string   "slug"
    t.string   "full_path",                         :null => false
    t.text     "content"
    t.integer  "position",       :default => 0,     :null => false
    t.integer  "children_count", :default => 0,     :null => false
    t.boolean  "is_published",   :default => true,  :null => false
    t.boolean  "is_shared",      :default => false, :null => false
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
  end

  add_index "cms_pages", ["parent_id", "position"], :name => "index_cms_pages_on_parent_id_and_position"
  add_index "cms_pages", ["site_id", "full_path"], :name => "index_cms_pages_on_site_id_and_full_path"

  create_table "cms_revisions", :force => true do |t|
    t.string   "record_type", :null => false
    t.integer  "record_id",   :null => false
    t.text     "data"
    t.datetime "created_at"
  end

  add_index "cms_revisions", ["record_type", "record_id", "created_at"], :name => "index_cms_revisions_on_record_type_and_record_id_and_created_at"

  create_table "cms_sites", :force => true do |t|
    t.string  "label",                          :null => false
    t.string  "identifier",                     :null => false
    t.string  "hostname",                       :null => false
    t.string  "path"
    t.string  "locale",      :default => "en",  :null => false
    t.boolean "is_mirrored", :default => false, :null => false
  end

  add_index "cms_sites", ["hostname"], :name => "index_cms_sites_on_hostname"
  add_index "cms_sites", ["is_mirrored"], :name => "index_cms_sites_on_is_mirrored"

  create_table "cms_snippets", :force => true do |t|
    t.integer  "site_id",                       :null => false
    t.string   "label",                         :null => false
    t.string   "identifier",                    :null => false
    t.text     "content"
    t.integer  "position",   :default => 0,     :null => false
    t.boolean  "is_shared",  :default => false, :null => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  add_index "cms_snippets", ["site_id", "identifier"], :name => "index_cms_snippets_on_site_id_and_identifier", :unique => true
  add_index "cms_snippets", ["site_id", "position"], :name => "index_cms_snippets_on_site_id_and_position"

  create_table "debates", :force => true do |t|
    t.string   "topic"
    t.integer  "site_id"
    t.boolean  "active"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "districts", :force => true do |t|
    t.integer  "district_number"
    t.text     "sections"
    t.integer  "site_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "document_topics", :force => true do |t|
    t.string   "name"
    t.integer  "site_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "document_topics_documents", :id => false, :force => true do |t|
    t.integer "document_topic_id"
    t.integer "document_id"
  end

  create_table "documents", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "site_id"
    t.integer  "representative_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.string   "topic_ids"
    t.string   "type"
    t.string   "document_kind"
    t.datetime "published_at"
  end

  create_table "elections", :force => true do |t|
    t.string   "name"
    t.boolean  "active"
    t.integer  "site_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "events", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "venue"
    t.datetime "date"
    t.integer  "site_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "address"
  end

  create_table "events_posts", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.boolean  "draft"
    t.datetime "published_at"
    t.integer  "site_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "news", :force => true do |t|
    t.string   "title"
    t.string   "topic"
    t.datetime "date"
    t.text     "content"
    t.integer  "site_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "phrases", :force => true do |t|
    t.string   "phrase"
    t.integer  "site_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "political_parties", :force => true do |t|
    t.string   "name"
    t.string   "initials"
    t.string   "logo"
    t.integer  "site_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.boolean  "visible"
  end

  create_table "positions", :force => true do |t|
    t.integer  "site_id"
    t.integer  "topic_id"
    t.integer  "political_party_id"
    t.text     "content"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.integer  "election_id"
  end

  add_index "positions", ["political_party_id"], :name => "index_positions_on_political_party_id"
  add_index "positions", ["site_id"], :name => "index_positions_on_site_id"
  add_index "positions", ["topic_id"], :name => "index_positions_on_topic_id"

  create_table "questions", :force => true do |t|
    t.text     "question"
    t.integer  "site_id"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
    t.integer  "votes_count", :default => 0
    t.integer  "election_id"
  end

  create_table "representatives", :force => true do |t|
    t.string   "name"
    t.integer  "political_party_id"
    t.string   "position"
    t.string   "district"
    t.string   "email"
    t.string   "phone"
    t.string   "avatar"
    t.integer  "commisions_id"
    t.text     "biography"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.integer  "site_id"
    t.text     "comissions"
    t.string   "twitter"
    t.integer  "circumscription"
    t.date     "birthday"
    t.string   "substitute"
    t.string   "facebook"
    t.string   "gender"
    t.text     "section"
    t.string   "representation_type"
    t.string   "office"
    t.string   "curul_link"
    t.integer  "election_id"
  end

  add_index "representatives", ["commisions_id"], :name => "index_representatives_on_commisions_id"
  add_index "representatives", ["political_party_id"], :name => "index_representatives_on_political_party_id"

  create_table "settings", :force => true do |t|
    t.string   "var",                      :null => false
    t.text     "value"
    t.integer  "thing_id"
    t.string   "thing_type", :limit => 30
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  add_index "settings", ["thing_type", "thing_id", "var"], :name => "index_settings_on_thing_type_and_thing_id_and_var", :unique => true

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       :limit => 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type", "context"], :name => "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", :force => true do |t|
    t.string "name"
  end

  create_table "topics", :force => true do |t|
    t.string   "name"
    t.integer  "site_id"
    t.string   "kind"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "votes", :force => true do |t|
    t.integer  "tendency"
    t.string   "voteable_type"
    t.integer  "voteable_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

end
