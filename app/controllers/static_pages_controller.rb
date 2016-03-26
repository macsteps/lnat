class StaticPagesController < ApplicationController
  before_action :authenticate_user!, only: [:settings]

  def home
  end

  def settings
  end
end
