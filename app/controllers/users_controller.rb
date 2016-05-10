class UsersController < ApplicationController
  def show
    User.find
  end
end
