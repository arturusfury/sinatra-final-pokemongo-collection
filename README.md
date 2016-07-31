# PokemonGo Collection

This app is to keeping track of all of your pokemon you have in PokemonGo.  At
this point we only use the Kanto Pokedex, however it would make sense for the
creators of PokemonGO to expand to the other regions eventually so we need to
make sure we have the ability to expand our database (aka Pokedex)

## Usage

To use this app you need to clone down the repository and then run `bundle
install` to ensure you have all the proper gems installed and ready to use.
Once complete you will need to run `rake db:migrate` to setup the database
correctly and then you should be able to type `shotgun` to launch the app on
the default port of 9393.
