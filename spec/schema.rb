ActiveRecord::Schema.define :version => 0 do
  create_table "ibf_members", :force => true do |t|
    t.string   "name",                                        :default => "",      :null => false
    t.integer  "mgroup",                  :limit => 2,        :default => 0,       :null => false
    t.string   "email",                   :limit => 150,      :default => "",      :null => false
    t.integer  "joined",                                      :default => 0,       :null => false
    t.string   "ip_address",              :limit => 16,       :default => "",      :null => false
    t.integer  "posts",                   :limit => 3,        :default => 0
    t.string   "title",                   :limit => 64
    t.boolean  "allow_admin_mails"
    t.string   "time_offset",             :limit => 10
    t.string   "hide_email",              :limit => 8
    t.boolean  "email_pm"
    t.boolean  "email_full"
    t.integer  "skin",                    :limit => 2
    t.integer  "warn_level"
    t.integer  "warn_lastwarn",                               :default => 0,       :null => false
    t.string   "language",                :limit => 32
    t.integer  "last_post"
    t.string   "restrict_post",           :limit => 100,      :default => "0",     :null => false
    t.boolean  "view_sigs",                                   :default => true
    t.boolean  "view_img",                                    :default => true
    t.boolean  "view_avs",                                    :default => true
    t.boolean  "view_pop",                                    :default => true
    t.integer  "bday_day"
    t.integer  "bday_month"
    t.integer  "bday_year"
    t.integer  "new_msg",                 :limit => 1,        :default => 0
    t.integer  "msg_total",               :limit => 2,        :default => 0
    t.boolean  "show_popup",                                  :default => false
    t.string   "misc",                    :limit => 128
    t.integer  "last_visit",                                  :default => 0
    t.integer  "last_activity",                               :default => 0
    t.boolean  "dst_in_use",                                  :default => false
    t.string   "view_prefs",              :limit => 64,       :default => "-1&-1"
    t.boolean  "coppa_user",                                  :default => false
    t.string   "mod_posts",               :limit => 100,      :default => "0",     :null => false
    t.string   "auto_track",              :limit => 50,       :default => "0"
    t.string   "temp_ban",                :limit => 100,      :default => "0"
    t.integer  "sub_end",                                     :default => 0,       :null => false
    t.string   "login_anonymous",         :limit => 3,        :default => "0&0",   :null => false
    t.text     "ignored_users"
    t.string   "mgroup_others",                               :default => "",      :null => false
    t.string   "org_perm_id",                                 :default => "",      :null => false
    t.string   "member_login_key",        :limit => 32,       :default => "",      :null => false
    t.integer  "member_login_key_expire",                     :default => 0,       :null => false
    t.integer  "subs_pkg_chosen",         :limit => 2,        :default => 0,       :null => false
    t.boolean  "has_blog",                                    :default => false,   :null => false
    t.text     "members_markers"
    t.string   "members_editor_choice",   :limit => 3,        :default => "std",   :null => false
    t.boolean  "members_auto_dst",                            :default => true,    :null => false
    t.string   "members_display_name",                        :default => "",      :null => false
    t.boolean  "members_created_remote",                      :default => false,   :null => false
    t.text     "members_cache",           :limit => 16777215
    t.integer  "members_disable_pm",                          :default => 0,       :null => false
    t.integer  "members_profile_views",                       :default => 0,       :null => false
    t.string   "members_l_display_name",                      :default => "0",     :null => false
    t.string   "members_l_username",                          :default => "0",     :null => false
    t.text     "failed_logins"
    t.integer  "failed_login_count",      :limit => 2,        :default => 0,       :null => false
    t.integer  "has_gallery",                                 :default => 0
    t.string   "persistence_token",                                                :null => false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.string   "single_access_token"
  end

  add_index "ibf_members", ["mgroup"], :name => "mgroup"

  create_table "ibf_members_converge", :primary_key => "converge_id", :force => true do |t|
    t.string  "converge_email",     :limit => 250, :default => "", :null => false
    t.integer "converge_joined",                   :default => 0,  :null => false
    t.string  "converge_pass_hash", :limit => 32,  :default => "", :null => false
    t.string  "converge_pass_salt", :limit => 5,   :default => "", :null => false
  end

  add_index "ibf_members_converge", ["converge_email"], :name => "converge_email"
end