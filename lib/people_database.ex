defmodule PeopleDatabase do
  def start(people \\ []) do
    IO.puts("Program started")
    IO.puts(people)
    initialize_database(people)
  end

  def load(list) do

  end

  def initialize_database(people) when is_list(people) do
    IO.puts("Database initialized")
    Agent.start_link(fn -> people end, name: :database)
    msg = Agent.get(:database, fn list -> list end)
    IO.puts(msg)
  end

  def get_data do
    list = Agent.get(:database, fn list -> list end)
    IO.puts(list)
    list
  end

  def add(person) do
    Agent.update(:database, fn list -> [person|list] end)
  end
end
