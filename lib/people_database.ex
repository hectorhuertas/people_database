defmodule PeopleDatabase do
  def start(people \\ []) do
    # people = [%Person{email: "bob", state: "NY"},%Person{email: "hector"},%Person{email: "peter"}]
    initialize_database
    load(people)
  end

  def initialize_database do
    Agent.start_link(fn -> [] end, name: :database)
  end

  def load(people) do
    Enum.each(people, fn person -> add(person) end)
  end

  def add(%Person{} = person) do
    Agent.update(:database, fn list -> [person|list] end)
  end

  def add(person) do
    add(struct(Person, person))
  end

  def delete_by_email(email) do
    all
    |> Enum.find(fn  person -> person.email === email end)
    |> remove
  end

  def remove(person) do
    Agent.update(:database, fn  list -> List.delete(list, person) end)
  end

  def all do
    Agent.get(:database, fn list -> list end)
  end

  def from(state) do
    all
      |> Enum.filter(fn person -> person.state === state end)
  end

  # def where(options) do
  #   all
  #   |> Enum.filter(fn person -> %Person{options} === person end)
  # end

  def count_from(state) do
    from(state)
      |> Enum.count
  end

  def emails do
    all
    |> Enum.map(fn person -> person.email end)
    |> Enum.join(", ")
  end
end
