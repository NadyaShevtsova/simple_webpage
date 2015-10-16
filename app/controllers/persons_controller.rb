class PersonsController < ApplicationController
  def index
    @q = Person.search(params[:q])
    @persons = @q.result(distinct: true)
  end

private
  def person_params
    params.require(:person).permit(:first_name, :last_name)
  end
end
