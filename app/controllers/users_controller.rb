class UsersController < ApplicationController
  before_action :signed_in?, only: [:show]
  def splash; end

  def signed_out; end
end
