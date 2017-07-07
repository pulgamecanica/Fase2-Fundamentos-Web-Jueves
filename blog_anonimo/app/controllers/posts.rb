get '/' do
  # La siguiente linea hace render de la vista 
  # que esta en app/views/index.erb
  @tags_total = Tag.all
  @posts_total = Post.all
  erb :index
end

post '/newpost' do
  title = params[:yourposttitle]
  content = params[:yourpost]
  tag1 = params[:yourtag1]
  tag2 = params[:yourtag2]
  tag3 = params[:yourtag3]
  new_post = Post.create(title: title, content: content)
  tag1_1 = Tag.create(name: tag1)
  tag2_1 = Tag.create(name: tag2)
  tag3_1 = Tag.create(name: tag3)
  relation1 = Relation.create(post_id: new_post.id, tag_id: tag1_1.id)
  relation2 =Relation.create(post_id: new_post.id, tag_id: tag2_1.id)
  relation3 =Relation.create(post_id: new_post.id, tag_id: tag3_1.id)
  if new_post.save
  p   "Saved post"

  elsif tag1_1.save
  p  "Saved tag1"

  elsif relation1.save
  p  "Saved relation1"

  elsif tag2_1.save
  p  "Saved tag2"
  
  elsif relation2.save
  p  "Saved relation2"

  elsif tag3_1.save
  p  "Saved tag3"

  elsif relation3.save
  p  "Saved relation3"

  else
  p "Error"
   end
   redirect to '/'
end
# get '/login' do
#   @user = User.find(session[:id])
#   @urls_total_user = @user.urls.order('visits DESC')
#    erb :login_user
# end

# get '/logout' do
#   session.clear
#   redirect '/'
# end

get '/search_by_tag' do
  puts "dentro de get /search_by_tag"
  p tag_input = params[:searchtag]
  p @show_post = Tag.find_by(name: tag_input).posts
  # @show_post.each do |x|
  #   p "OBJETO #{x}"
  # end

  erb :post_tag
end



# get '/:user_urls' do
#   url_input = params[:urls]
#   url = Url.find_by(id: url_input) 
#   visitas = url.visits +=1
#   url.save
#   redirect to url.original
# end


# post '/login' do
#   email = params[:email]
#   password = params[:password]
#   user_login = User.find_by(email: email)
#   if User.authenticate(email, password)== true
#      session[:id] = user_login.id
#      redirect "/login"
#   elsif User.authenticate(email, password)== false
#      "Wrong email or password"
#   redirect "/"
#   end
# end
# ###********************************************###


# post '/urls' do
#   # crea una nueva Url
#   url = params[:user_input]
#   new_URL = Url.create(original: url, visits: 0)
#   if new_URL.save
#     p session[:message] = "Saved"
#     else
#     p "Error"
#   end
#   redirect to '/'
# end

# post '/user_urls' do
#   # crea una nueva Url
#   user_url = params[:user_input]
#   new_URL = Url.create(user_id: session[:id], original: user_url, visits: 0)
#   if new_URL.save
#     p session[:message] = "Saved"
#     else
#     p "Error"
#   end
#   redirect to '/login'
# end