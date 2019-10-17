defmodule CommentBoxWeb.PageController do
  use CommentBoxWeb, :controller

	alias CommentBox.Comment
	alias CommentBox.Auth
	alias CommentBox.Auth.User

	def index(conn, _params) do
		comments = Comment.list_comments()
		users = Auth.list_users()
		render(conn, "index.html", comments: comments, users: users)
	end
end
