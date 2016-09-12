class Admin::ApplicationController < ApplicationController
  before_action :admin_only
    layout "admin"
end