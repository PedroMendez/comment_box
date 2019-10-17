defmodule CommentBox.Repo.Migrations.AddReplyToComments do
  use Ecto.Migration

  def change do
  	alter table(:comments) do
  		add :reply, :string
  	end
  end
end
