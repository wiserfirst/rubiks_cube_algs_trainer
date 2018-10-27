defmodule Rubiks.AlgorithmCtxTest do
  use ExUnit.Case
  alias Rubiks.AlgorithmCtx

  test "sanitize solution" do
    assert AlgorithmCtx.sanitize("R U R'") == "R U R'"
    assert AlgorithmCtx.sanitize("(U R U' R') (U' F' U F)") == "U R U' R' U' F' U F"
  end

  test "get setup by reversing alg" do
    assert AlgorithmCtx.setup("F' U' F") == "F' U F"
    assert AlgorithmCtx.setup("R U' R' U R U2 R' U R U' R'") == "R U R' U' R U2 R' U' R U R'"
  end

  test "reverse step" do
    assert AlgorithmCtx.reverse_step("R2") == "R2"
    assert AlgorithmCtx.reverse_step("U") == "U'"
    assert AlgorithmCtx.reverse_step("F'") == "F"
  end
end
