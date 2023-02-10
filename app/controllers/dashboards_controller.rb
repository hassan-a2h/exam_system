# frozen_string_literal: true

class DashboardsController < ApplicationController
  skip_before_action :authenticate_user!

  def show; end
end
