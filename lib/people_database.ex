defmodule PeopleDatabase do
  def start(people \\ []) do
    IO.puts("Welcome to the awesome Bob's database")
    IO.puts(people)
    initialize_database(people)
  end

  def load(list) do

  end

  def initialize_database(people) do
    IO.puts('Yeah')
    Agent.start_link(fn -> people end, name: :cosa)
    msg = Agent.get(:cosa, fn list -> list end)
    IO.puts(msg)
  end

  def get_data do
    msg = Agent.get(:cosa, fn list -> list end)
    IO.puts(msg)    
  end
end
