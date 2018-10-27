defmodule Rubiks.Algorithm do
  use Ecto.Schema
  import Ecto.Changeset

  schema "algorithms" do
    field(:category, :string)
    field(:solution, :string)
    field(:setup, :string)

    timestamps(type: :utc_datetime)
  end

  @required_fields [
    :category,
    :solution
  ]

  @optional_fields [
    :setup
  ]

  def changeset(existing, params \\ :empty) do
    existing
    |> cast(params, @required_fields ++ @optional_fields)
    |> validate_required(@required_fields)
  end
end
