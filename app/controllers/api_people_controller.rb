class ApiPeopleController < ApplicationController
  def index
    uri = URI.parse('http://assessapp.herokuapp.com/api/temporary_people?q%5Bs%5D=last_name+as')
    res = Net::HTTP.get_response(uri)
    @api_people = []
    if res.is_a?(Net::HTTPSuccess)
      parsed = JSON.parse(res.body)
      @api_people = parsed['response']
      @api_people = @api_people.map{|k| k['person'] if k['person']['assessment_count'] > 0 and k['person']['organisation']['title'].include? "ABC"}.compact
    end
  end
end
