class Api::TemporaryPeopleController < ApplicationController
  skip_before_filter :verify_authenticity_token, only: [:update]

  def index
    q = Person.search(params[:q])
    people = q.result(distinct: true)
    render json: { status: "success",
                   response: people.map{ |p| PersonSerializer.new(p) } }
  end

  def show
    person = Person.find(params[:id])
    render json: { status: "success", response: PersonSerializer.new(person) }
  end

  def update
    person = Person.find(params[:id])
    if person.update person_params
      render json: { status: "success", response: PersonSerializer.new(person) }
    else
      render json: { errors: person.errors.full_messages }
    end
  end

  private

  def person_params
    params.require(:person).permit(:first_name, :last_name, :organization_id)
  end
end
