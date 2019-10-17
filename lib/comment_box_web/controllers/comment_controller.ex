defmodule CommentBoxWeb.CommentController do
	use CommentBoxWeb, :controller

	import Ecto.Changeset

	alias CommentBox.Comment
	alias CommentBox.Repo	
	alias CommentBox.Auth
    alias CommentBox.Auth.User

	def index(conn, _params) do
		comments = Comment.list_comments()
		users = Auth.list_users()
		render(conn, "index.html", comments: comments, users: users)
	end

	def show(conn, %{"id" => id}) do
		comment = Comment.get_comment!(id)
		render(conn, "show.html", comment: comment)
	end 

    def new(conn, _params) do
		changeset = change(%Comment{})
		users = Auth.list_users()
    	render(conn, "new.html", changeset: changeset, users: users)
    end

	def create(conn, %{"comment" => comment_params}) do
    	changeset = cast(%Comment{}, comment_params, [:title, :text, :owner, :parent])
		case Repo.insert(changeset) do
			{:ok, %Comment{}} ->
				conn
				|> put_flash(:info, "Created succefully!")
				|> redirect(to: page_path(conn, :index))
			{:error, changeset} ->
			    conn
				|> put_flash(:error, "Error creating comment")
				|> render("new.html", changeset: changeset)
		end		
    end    

    def edit(conn, %{"id" => id}) do
    	changeset = change(%Comment{})
    	render(conn, "reply.html", changeset: changeset, id: id)
    end     
end