defmodule CommentBox.Repo.Migrations.AddParentToComments do
  use Ecto.Migration

  def change do
  	alter table(:comments) do
  		add :parent, :integer
  	end
  end
end
