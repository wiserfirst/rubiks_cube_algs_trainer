# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Rubiks.Repo.insert!(%Rubiks.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias Rubiks.AlgorithmCtx

algs = [
  "R U R'",
  "F' U' F",
  "U' F' U F",
  "U R U' R'",
  "(U R U' R') (U' F' U F)",
  "(U' F' U F) (U R U' R')",
  "(F' U F) (U' F' U F)",
  "(R U R') (U' R U R')",
  "(R U' R') (U R U' R')",
  "(F' U' F) (U F' U' F)",
  "(R U R' U') (R U R' U') (R U R')",
  "(R U' R') (d R' U R)",
  "(U F' U F) (U F' U2 F)",
  "(U F' U' F) (d' F U F')",
  "(U' R U' R') (U' R U2 R')",
  "(U' R U R') (d R' U' R)",
  "(R U' R' U) (d R' U' R)",
  "(F' U F U') (d' F U F')",
  "(U F' U2 F) (U F' U2 F)",
  "(U' R U2 R') (U' R U2 R')",
  "(U F' U' F) (U F' U2 F)",
  "(U' R U R') (U' R U2 R')",
  "(U' R U' R' U) (R U R')",
  "(U F' U F U') (F' U' F)",
  "(U' R U R' U) (R U R')",
  "(U F' U' F U') (F' U' F)",
  "(U F' U2 F U') (R U R')",
  "(U' R U2 R' U) (F' U' F)",
  "(R U R' U') U' (R U R' U') (R U R')",
  "y' (R' U' R U) U (R' U' R U) (R' U' R)",
  "(U2 R U R') (U R U' R')",
  "(U2 F' U' F) (U' F' U F)",
  "(U R U2 R') (U R U' R')",
  "(U' F' U2 F) (U' F' U F)",
  "(R U2 R') (U' R U R')",
  "(F' U2 F) (U F' U' F)",
  "(R U' R' d R' U2 R) (U R' U2 R)",
  "(R U' R' U R U2 R') (U R U' R')",
  "(R U' R' U' R U R') (U' R U2 R')",
  "(R U R' U' R U' R') (U d R' U' R)",
  "(R U' R' d R' U' R) (U' R' U' R)"
]

algs
|> Enum.each(fn alg ->
  AlgorithmCtx.insert_or_update(%{
    category: "F2L",
    solution: alg
  })
end)
