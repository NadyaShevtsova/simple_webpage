class OrganizationsController < ApplicationController
  def index
    @q = Organization.search(params[:q])
    @organizations = @q.result
  end
end
