defmodule PeopleDatabase do
  def start(people \\ []) do
    IO.puts("Program started")
    initialize_database
    load(people)
  end

  def load(people) do
    Enum.each(people, fn person -> PeopleDatabase.add(person) end)
  end

  def add(%Person{} = person) do
    Agent.update(:database, fn list -> [person|list] end)
  end

  def initialize_database do
    Agent.start_link(fn -> [] end, name: :database)
    IO.puts("Database initialized")
  end

  def get_data do
    list = Agent.get(:database, fn list -> list end)
    # IO.puts(List.to_string(list))
    list
  end
  # def initialize_database(people) when is_list(people) do
  #   Agent.start_link(fn -> people end, name: :database)
  #   IO.puts("Database initialized")
  #   # msg = Agent.get(:database, fn list -> list end)
  #   # IO.puts(msg)
  # end

  # def initialize_database(people) do
  #   IO.puts("Param must be a list")
  # end

  # def add(%Person{} = person) do
  #   Agent.update(:database, fn list -> [person|list] end)
  # end
  # def add(person) do
  #   IO.puts("Didn't match")
  #   Agent.update(:database, fn list -> [person|list] end)
  # end
end
