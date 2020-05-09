class PagesController < ApplicationController
  before_action :sign_in_required, only: [:about]
  def home
  end

  def about
  end

  def help
  end

  def privacy
  end

  def terms_of_service
  end
end
