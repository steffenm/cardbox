class ApplicationController < ActionController::Base
  helper MenuHelper
  protect_from_forgery
  before_filter :set_gettext_locale
end
