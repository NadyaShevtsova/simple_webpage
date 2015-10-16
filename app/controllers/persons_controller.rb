class PersonsController < ApplicationController
  def index
    @q = Person.search(params[:q])
    @persons = @q.result(distinct: true)
  end

  def show
    @person = Person.find(params[:id])
  end

private
  def person_params
    params.require(:person).permit(:first_name, :last_name)
  end
end
