# Marvelite #

A very simple sample app on ios architecture following the modular clean approach. Basically, it gives us the list of characters and comics from marvel API. There project has seen quite a few iterations and still needs some more work.

The project has been divided into 3 main layers/modules. There was point where these layers were actually separated into different frameworks but now they are all inside same project but given correct folder structures.

Data layer, Domain layer and Presentation layer where Domain layer is the inner most layer and not dependent on any other layers. The presentation layer and Data layer depends on the Domain layer.
It is safe to say that there is also another layer namely app layer that know about all the 3 layers where I have put the dependencies injections.

It uses some RxSwift but only for some components on rxswift branch. On the main branch, it makes use of async/await for handling asynchronous tasks.

This project uses Swift Package Manager to manage dependencies.
