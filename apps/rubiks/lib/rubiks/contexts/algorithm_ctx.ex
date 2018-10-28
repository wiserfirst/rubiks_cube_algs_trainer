defmodule Rubiks.AlgorithmCtx do
  alias Rubiks.{Algorithm, Repo}

  def get(id) do
    Repo.get(Algorithm, id)
  end

  def random_id do
    Algorithm
    |> Repo.aggregate(:count, :id)
    |> :rand.uniform()
  end

  def random_alg do
    get(random_id())
  end

  def get_by_text(text) do
    solution = sanitize(text)
    setup_txt = setup(solution)

    %{
      solution: solution,
      setup_txt: setup_txt
    }
  end

  def create(attrs \\ %{}) do
    %Algorithm{}
    |> Algorithm.changeset(prepare_attrs(attrs))
    |> Repo.insert()
  end

  def update(%Algorithm{} = record, attrs) do
    record
    |> Algorithm.changeset(prepare_attrs(attrs))
    |> Repo.update()
  end

  defp prepare_attrs(attrs) do
    attrs = Map.update!(attrs, :solution, &sanitize/1)

    Map.put(attrs, :setup_txt, setup(attrs.solution))
  end

  def sanitize(text) do
    Regex.replace(~r/\(|\)/, text, "")
  end

  def setup(text) do
    text
    |> String.split(" ")
    |> Enum.map(&reverse_step/1)
    |> Enum.reverse()
    |> Enum.join(" ")
  end

  ~w(F B U D R L f b u d r l x y z M E S)
  |> Enum.each(fn s ->
    def reverse_step(unquote(s) <> "'"), do: unquote(s)
    def reverse_step(unquote(s) <> "2"), do: unquote(s) <> "2"
    def reverse_step(unquote(s)), do: unquote(s) <> "'"
  end)

  def insert_or_update(attrs) do
    Algorithm
    |> Repo.get_by(solution: attrs.solution)
    |> handle_insert(attrs)
  end

  def handle_insert(%Algorithm{} = existing, attrs), do: update(existing, attrs)
  def handle_insert(nil, attrs), do: create(attrs)
end
