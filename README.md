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

## Mockups & Database Information

We will need multiple tables in our database to hold the information for all of
our users and the different pokemon.

A User has a username, password, email and will have many pokemon in their
collection.

A Pokemon has a national pokedex id, regional pokedex id, a name and a sprite
or image of said Pokemon.  We will link to an external source to get those
images for now.  If we ever deployed this full time we would use our own images

Since we need to setup a relation between these two with a collection table.  It
will contain the user (trainer) id, a pokemon id which relates to the national
pokedex id and the CP or combat power of that pokemon.

## Images can be grabbed from

http://assets.pokemon.com/assets/cms2/img/pokedex/full/150.png

Change the number at the end to the national pokedex number
