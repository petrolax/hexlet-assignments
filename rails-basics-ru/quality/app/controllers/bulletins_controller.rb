# frozen_string_literal: true

class BulletinsController < ApplicationController
  # BEGIN
  def index
    @bulletins = Bulletin.where(published: true)
    respond_to :html
  end

  def show
    @bulletin = Bulletin.find_by(id: params[:id], published: true)
    respond_to :html
  end
  # END
end
