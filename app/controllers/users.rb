# DISPLAY NEW USER FORM
get '/users/new' do
	erb :'user/new'
end

# CREATE NEW USER
post '/users' do
	user = User.create(name: params[:name], email: params[:email], password: params[:password])
	# redirect_to '/users/:id'
		redirect "/users/#{user.id}"
end

#DISPLAY USER EDIT FORM
get '/users/:id/edit' do
	@user = User.find(params[:id])
	erb :'user/edit'
end

# UPDATE USER:
patch '/users:id' do
	@user = User.find(params[:id])
	user.update(name: params[:name], email: params[:email], password: params[:password], description: params[:description])
			redirect "/users/#{user.id}"
end

# DELETE USER
delete '/users:/id' do
	user = User.find(params[:id])
	user.destroy
	erb :'static/index'
end

# VIEW USER'S PROFILE
get '/users/:id' do
	@user = User.find(params[:id])
	erb :'user/show' ### COMMON NAME: SHOW or SINGLE

end

