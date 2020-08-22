CHANGE TO      form_for        FROM        form_tag

UPDATE posts_controller.rb
TO
	@post.update(params.require(:post).permit(:title, :description))


FROM
	@post.update(title: params[:title], description: params[:description])


=========================================================


UPDATE routes.rb:
TO
    resources :posts, only: [:index, :show, :new, :create, :edit]

    patch 'posts/:id', to: 'posts#update'

 _________________________   

EITHER FROM
    resources :posts, only: [:index, :show, :new, :create, :edit, :update]
_________________________   

OR FROM
    resources :posts, only: [:index, :show, :new, :create, :edit]

    put 'posts/:id', to: 'posts#update'


=========================================================

UPDATED edit form for file app/views/posts/edit.html.erb

    <h3>Post Form</h3>
 
<%= form_for(@post) do |f| %>
  <label>Post title:</label><br>
  <%= f.text_field :title %><br>
 
  <label>Post description</label><br>
  <%= f.text_area :description %><br>
 
  <%= f.submit %>
<% end %>


ORIGINAL edit form for file app/views/posts/edit.html.erb

    <h3>Post Form</h3>

<%= form_tag post_path(@post), method: "put" do %>
  <label>Post title:</label><br>
  <%= text_field_tag :title, @post.title %><br>

  <label>Post Description</label><br>
  <%= text_area_tag :description, @post.description %><br>
  
  <%= submit_tag "Submit Post" %>
<% end %>






