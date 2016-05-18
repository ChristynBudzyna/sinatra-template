get '/users' do
  redirect '/users/new' #change this
end

get '/users/new' do
  erb :'users/new'
end

post '/users' do
  @user = User.new(params[:user])
  if @user.save
    session[:user_id] = @user.id
    redirect "/" #change to user/users/:id
  else
    @errors = @user.errors.full_messages
    erb :'/users/new'
  end
end

get '/users/:id' do
  @user = User.find_by(id: params[:id])
    if current_user && logged_in? # if you only want user to see their profile page
      erb :'users/show'
    else
      redirect '/'
    end
end