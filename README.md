# *paddock*

A simple application that analyzes F1 data, built with Ruby on Rails. This is a non-commercial project, aiming to bring together two of my hobbies: Formula One and software engineering

<p align="left"><img src="public/images/car.png" alt="F1-car" height="200px"></p>

## Made with

- [Ruby](https://www.ruby-lang.org/en/downloads/): 2.6.5
- [Rails](https://rubyonrails.org/): 6.0.3+
- [PostgreSQL](https://www.postgresql.org/): 12.2+

## Installation (#WIP)

Make sure you have installed all listed project dependencies. 

Clone the project from Github and at the project's root directory run:

```shell
$ bundle install
$ rails db:drop db:create db:migrate RAILS_ENV=development

# seed the database with historic data
rake db:import_ergast_data

$ rails s
```
Application will now be available at `http://localhost:3000/`.

## Contributions

Contributions are welcome! For more details, see [Contributing](CONTRIBUTING.md).

## License

Distributed under the [MIT License](LICENSE).

## Acknowledgements

- all motor racing data present in the application, are available via the wonderful [Ergast Developer API](http://ergast.com/mrd/)
- icons made by <a href="https://www.flaticon.com/authors/smashicons" title="Smashicons">Smashicons</a> from <a href="https://www.flaticon.com/" title="Flaticon"> www.flaticon.com</a>
