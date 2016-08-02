# PokemonGo Collection

This app is to keeping track of all of your pokemon you have in PokemonGo.  At
this point we only use the Kanto Pokedex, however it would make sense for the
creators of PokemonGO to expand to the other regions eventually so we need to
make sure we have the ability to expand our database (aka Pokedex)

## Usage

To use this app you need to clone down the repository and then run `bundle
install` to ensure you have all the proper gems installed and ready to use.
Once complete you will need to run `rake db:migrate` to setup the database
and then you run `rake db:seed` to ensure you fill in the pokedex database
with all the right information.  After that is complete you should be able to
type `shotgun` to launch the app on the default port of 9393.  

## Submitting a Pull Request to Suggest an Improvement

If you see an opportunity for improvement and can make the change yourself go
ahead and use a typical git workflow to make it happen:

* Fork this curriculum repository
* Make the change on your fork, with descriptive commits in the standard format
* Open a Pull Request against this repo

## License

The is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
