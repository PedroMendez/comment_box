defmodule CommentBox.Repo.Migrations.CreateCommentsTable do
  use Ecto.Migration

  def change do
  	create table(:comments) do
  	    add :title, :string
      	add :text, :string
      	add :owner, :integer

      	timestamps()
    end
  end
end
