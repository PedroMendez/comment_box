defmodule CommentBoxWeb.UserController do
	use CommentBoxWeb, :controller

	import Ecto.Changeset

    alias CommentBox.Auth
    alias CommentBox.Auth.User	

	def index(conn, _params) do
		users = Auth.list_users()
		render(conn, "index.html", users: users)   
	end

	def show(conn, %{"id" => id}) do
		user = Auth.get_user!(id)
		render(conn, "show.html", user: user)
	end 

    def new(conn, _params) do
    	changeset = change(%User{})
    	render(conn, "new.html", changeset: changeset)
    end

	def create(conn, %{"user" => user_params}) do
		with {:ok, %User{} = user} <- Auth.create_user(user_params) do
			conn
			|> put_flash(:info, "User created succefully!")
			|> redirect(to: user_path(conn, :index))
		end
	end
end