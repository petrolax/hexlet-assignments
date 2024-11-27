# frozen_string_literal: true

class BulletinsController < ApplicationController
  # BEGIN
  def index
    @bulletins = Bulletin.where(published: true)
    respond_to do |format|
      format.html
      # format.json { render json: @bulletins }
    end
  end
  def show
    @bulletin = Bulletin.find_by(id: params[:id], published:true)
    respond_to do |format|
      format.html
      # format.json { render json: @bulletin }
    end
  end
  # END
end
