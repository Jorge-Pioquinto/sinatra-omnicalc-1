require "sinatra"
require "sinatra/reloader"
require "active_support/all"

get("/") do
  "
  <h1>Welcome to your Sinatra App!</h1>
  <p>Define some routes in app.rb</p>
  "
end

get("/square/new") do
  
  erb(:square_calc)
end 

get("/square/results") do
  @the_num = params.fetch("users_number")
  
  @the_result = @the_num.to_f ** 2
  
  erb(:square_results)
end

get("/square_root/new") do

  erb(:square_root_calc)
end

get("/square_root/results") do
  @the_num = params.fetch("users_number")

  @the_result = Math.sqrt(@the_num.to_f)

  erb(:square_root_results)
end

get("/payment/new") do

  erb(:payment_calc)
end

get("/payment/results") do
  @apr = params.fetch("user_apr")

  @years = params.fetch("user_years")

  @pv = params.fetch("user_pv")

  monthly_interest_rate = @apr.to_f/12/100
  n = @years.to_f * 12

  monthly_payment = (monthly_interest_rate * @pv.to_f) / (1 - (1 + monthly_interest_rate)**-n)

  @the_result = monthly_payment.to_fs(:currency)

  erb(:payment_results)
end

get("/random/new") do
  "Hello World"
end
