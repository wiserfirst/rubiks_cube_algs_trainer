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

  def sidebar_content do
    %{
      "1st Easy Cases" => [
        %{image_name: "friedrich-f2l-01.png", text: "R U R'"},
        %{image_name: "friedrich-f2l-17.png", text: "F' U' F"},
        %{image_name: "friedrich-f2l-19.png", text: "U' F' U F"},
        %{image_name: "friedrich-f2l-18.png", text: "U R U' R'"}
      ],
      "2nd Corner in bottom, edge in top layer" => [
        %{image_name: "friedrich-f2l-38.png", text: "(U R U' R') (U' F' U F)"},
        %{image_name: "friedrich-f2l-39.png", text: "(U' F' U F) (U R U' R')"},
        %{image_name: "friedrich-f2l-40.png", text: "(F' U F) (U' F' U F)"},
        %{image_name: "friedrich-f2l-42.png", text: "(R U R') (U' R U R')"},
        %{image_name: "friedrich-f2l-41.png", text: "(R U' R') (U R U' R')"},
        %{image_name: "friedrich-f2l-43.png", text: "(F' U' F) (U F' U' F)"}
      ],
      "3nd Corner in top, edge in middle" => [
        %{image_name: "friedrich-f2l-12.png", text: "(R U R' U') (R U R' U') (R U R')"},
        %{image_name: "friedrich-f2l-48.png", text: "(R U' R') (d R' U R)"},
        %{image_name: "friedrich-f2l-44.png", text: "(U F' U F) (U F' U2 F)"},
        %{image_name: "friedrich-f2l-46.png", text: "(U F' U' F) (d' F U F')"},
        %{image_name: "friedrich-f2l-45.png", text: "(U' R U' R') (U' R U2 R')"},
        %{image_name: "friedrich-f2l-47.png", text: "(U' R U R') (d R' U' R)"}
      ],
      "4nd Corner pointing outwards, edge in top layer" => [
        %{image_name: "friedrich-f2l-26.png", text: "(R U' R' U) (d R' U' R)"},
        %{image_name: "friedrich-f2l-27.png", text: "(F' U F U') (d' F U F')"},
        %{image_name: "friedrich-f2l-28.png", text: "(U F' U2 F) (U F' U2 F)"},
        %{image_name: "friedrich-f2l-29.png", text: "(U' R U2 R') (U' R U2 R')"},
        %{image_name: "friedrich-f2l-30.png", text: "(U F' U' F) (U F' U2 F)"},
        %{image_name: "friedrich-f2l-31.png", text: "(U' R U R') (U' R U2 R')"},
        %{image_name: "friedrich-f2l-20.png", text: "(U' R U' R' U) (R U R')"},
        %{image_name: "friedrich-f2l-21.png", text: "(U F' U F U') (F' U' F)"},
        %{image_name: "friedrich-f2l-22.png", text: "(U' R U R' U) (R U R')"},
        %{image_name: "friedrich-f2l-23.png", text: "(U F' U' F U') (F' U' F)"},
        %{image_name: "friedrich-f2l-24.png", text: "(U F' U2 F U') (R U R')"},
        %{image_name: "friedrich-f2l-25.png", text: "(U' R U2 R' U) (F' U' F)"}
      ],
      "5nd Corner pointing upwards, edge in top layer" => [
        %{image_name: "friedrich-f2l-13.png", text: "(R U R' U') U' (R U R' U') (R U R')"},
        %{image_name: "friedrich-f2l-14.png", text: "y' (R' U' R U) U (R' U' R U) (R' U' R)"},
        %{image_name: "friedrich-f2l-36.png", text: "(U2 R U R') (U R U' R')"},
        %{image_name: "friedrich-f2l-37.png", text: "(U2 F' U' F) (U' F' U F)"},
        %{image_name: "friedrich-f2l-34.png", text: "(U R U2 R') (U R U' R')"},
        %{image_name: "friedrich-f2l-35.png", text: "(U' F' U2 F) (U' F' U F)"},
        %{image_name: "friedrich-f2l-32.png", text: "(R U2 R') (U' R U R')"},
        %{image_name: "friedrich-f2l-33.png", text: "(F' U2 F) (U F' U' F)"}
      ],
      "6nd Corner in bottom, edge in middle" => [
        %{image_name: "friedrich-f2l-51.png", text: "(R U' R' d R' U2 R) (U R' U2 R)"},
        %{image_name: "friedrich-f2l-49.png", text: "(R U' R' U R U2 R') (U R U' R')"},
        %{image_name: "friedrich-f2l-50.png", text: "(R U' R' U' R U R') (U' R U2 R')"},
        %{image_name: "friedrich-f2l-15.png", text: "(R U R' U' R U' R') (U d R' U' R)"},
        %{image_name: "friedrich-f2l-16.png", text: "(R U' R' d R' U' R) (U' R' U' R)"}
      ]
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

    Map.put(attrs, :setup, setup(attrs.solution))
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
