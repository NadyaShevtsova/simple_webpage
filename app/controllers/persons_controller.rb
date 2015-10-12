class PersonsController < ApplicationController
  def index
    @persons = Person.all
  end

private
  def person_params
    params.require(:person).permit(:first_name, :last_name)
  end
end
