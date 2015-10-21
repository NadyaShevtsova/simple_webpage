class PeopleController < ApplicationController
  def index
    @q = Person.search(params[:q])
    @people = @q.result(distinct: true)
  end

  def show
    @person = Person.find(params[:id])
  end

  def update
    @person = Person.find(params[:id])
    if @person.update person_params
      render json: { success: true }
    else
      render json: @person.errors.messages
    end
  end

private
  def person_params
    params.require(:person).permit(:first_name, :last_name, :organization_id)
  end
end
