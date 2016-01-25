require('sinatra')
require('sinatra/reloader')
require('sinatra/activerecord')
require('./lib/employee')
require('./lib/division')
require('pry')
also_reload('lib/**/*.rb')

get('/') do
  @employees = Employee.all
  @divisions = Division.all
  erb(:index)
end

post '/add_employee' do
  new_employee_name = params.fetch("new_employee_name")
  if new_employee_name.length > 0
    new_employee = Employee.new( {name: new_employee_name, division_name: ""} )
    new_employee.save
  end
  redirect '/'
end

post '/add_division' do
  new_division_name = params.fetch("new_division_name")
  if new_division_name.length > 0
    new_division = Division.new( { name: new_division_name })
    new_division.save
  end
  redirect '/'
end

post '/set_employee_division/:id' do
  updating_employee = Employee.find( params[:id] )
  new_division_name = params[:list_id]
  updating_employee.update({division_name: new_division_name })
  redirect '/'
end
