get '/sessions/new' do
  erb :'sessions/new'
end

post '/sessions' do
  @user = User.find_by(email: params[:email])

  if @user && @user.authenticate(params[:password])
    session[:user_id] = @user.id
    redirect "/"
  else
    @errors = ["Invalid email address and/or password. Please try again."]
    erb :'sessions/new'
  end
end

delete '/sessions' do
  session[:user_id] = nil
  redirect '/'
end
