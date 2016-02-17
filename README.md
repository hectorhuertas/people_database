# PeopleDatabase

add people by
```
PeopleDatabase.add(first_name: "Tess", last_name: "Griffin", email: "tess@turing.io", state: "CO")
```

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add people_database to your list of dependencies in `mix.exs`:

        def deps do
          [{:people_database, "~> 0.0.1"}]
        end

  2. Ensure people_database is started before your application:

        def application do
          [applications: [:people_database]]
        end
