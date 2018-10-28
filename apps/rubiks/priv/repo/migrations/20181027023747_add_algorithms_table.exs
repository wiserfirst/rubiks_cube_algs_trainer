defmodule Rubiks.Repo.Migrations.AddAlgorithmsTable do
  use Ecto.Migration

  def change do
    create table(:algorithms) do
      add(:category, :string)
      add(:solution, :string)
      add(:setup_txt, :string)

      timestamps(type: :timestamp)
    end
  end
end
