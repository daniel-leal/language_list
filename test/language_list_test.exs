defmodule LanguageListTest do
  use ExUnit.Case

  describe "new/0" do
    test "new list" do
      assert LanguageList.new() == []
    end
  end

  describe "add/2" do
    test "add a language to a list" do
      language = "Elixir"
      list = [language]

      assert LanguageList.new() |> LanguageList.add(language) == list
    end

    test "add several languages to a list" do
      list =
        LanguageList.new()
        |> LanguageList.add("Clojure")
        |> LanguageList.add("Haskell")
        |> LanguageList.add("Erlang")
        |> LanguageList.add("F#")
        |> LanguageList.add("Elixir")

      assert list == ["Elixir", "F#", "Erlang", "Haskell", "Clojure"]
    end
  end

  describe "remove/1" do
    test "add then remove results in empty list" do
      list =
        LanguageList.new()
        |> LanguageList.add("Elixir")
        |> LanguageList.remove()

      assert list == []
    end

    test "adding two languages, when removed, removes first item" do
      list =
        LanguageList.new()
        |> LanguageList.add("F#")
        |> LanguageList.add("Elixir")
        |> LanguageList.remove()

      assert list == ["F#"]
    end
  end

  describe "first/1" do
    test "add one language, then get the first" do
      assert LanguageList.new() |> LanguageList.add("Elixir") |> LanguageList.first() == "Elixir"
    end

    test "add a few languages, then get the first" do
      first =
        LanguageList.new()
        |> LanguageList.add("Elixir")
        |> LanguageList.add("Prolog")
        |> LanguageList.add("F#")
        |> LanguageList.first()

      assert first == "F#"
    end
  end

  describe "count/1" do
    test "the count of a new list is 0" do
      assert LanguageList.new() |> LanguageList.count() == 0
    end

    test "the count of a one-language list is 1" do
      count =
        LanguageList.new()
        |> LanguageList.add("Elixir")
        |> LanguageList.count()

      assert count == 1
    end

    test "the count of a multiple-item list is equal to its length" do
      count =
        LanguageList.new()
        |> LanguageList.add("Elixir")
        |> LanguageList.add("Prolog")
        |> LanguageList.add("F#")
        |> LanguageList.count()

      assert count == 3
    end
  end

  describe "exciting_list?/1" do
    test "an exciting language list" do
      assert LanguageList.exciting_list?(["Clojure", "Haskell", "Erlang", "F#", "Elixir"])
    end

    test "not an exciting language list" do
      refute LanguageList.exciting_list?(["Java", "C", "JavaScript"])
    end
  end
end
