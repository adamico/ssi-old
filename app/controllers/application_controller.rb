class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :ensure_domain, :old_api_redirect

  APP_DOMAIN = 'www.school-immunotoxicology.org'
  APP_STAGING = 'ssi-staging.herokuapp.com'

  def ensure_domain
    if Rails.env.production? && request.remote_ip != "127.0.0.1" && request.env['HTTP_HOST'] != APP_STAGING
      if request.env['HTTP_HOST'] != APP_DOMAIN
        # HTTP 301 is a "permanent" redirect
        redirect_to "http://#{APP_DOMAIN}", :status => 301
      end
    end
  end

  def old_api_redirect
    old_page_param = params[:rubrique]
    old_new_paths = {
      "303" => "previous",
      "305" => "summerschool/philosophy",
      "306" => "summerschool/staff",
      "310" => "program",
      "311" => "registration"
    }
    if old_page_param
      redirect_to "/#{old_new_paths[old_page_param]}", :status => 301
    end
  end
end
