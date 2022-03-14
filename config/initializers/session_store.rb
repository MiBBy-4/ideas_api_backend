if Rails.env == 'production'
  Rails.application.config.session_store :cookie_store, { 
    key: "ideas_backend_app",
    domain: :all,
    same_site: :none,
    secure: :true,
    tld_lenght: 2
  }
else
  Rails.application.config.session_store :cookie_store, key: "_authentication_app"
end