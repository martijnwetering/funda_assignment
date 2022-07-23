# Funda Assignment

## Description app

This app consists of two pages, a search page and a details page.
A user can enter a place or neighborhood and on pressing search
will be presented with a list of search results. Each result can
be selected to view it's details.

*Note: paging is not implemented due to time restrictions.*

## How to get started

The app should should be able to run directly after is has been
cloned to a local development environment and packages are installed
with `flutter pub get`. **Code generation** is
used to generate the JSON encoding and decoding of the models,
but this generated code is also committed to the repository.

## Architecture

The source code is divided over three layers. **Presentation** contains
all widgets and UI logic. Pages are at the root of the folder with
there widgets in the widgets sub folder.

Each page has it't own **provider**. Providers act as the **application**
layer and orchestrate use cases. In a simple app as this they just
fetch data and contain the state for the presentation layer.

Providers make use of the **infrastructure** layer that actually retrieves
the data and provides the models. This way the application layer does not
need to worry where the data comes from, it can just ask for it. In an
app of medium to large complexity it might be worth it adding a **domain**
layer. This layer can insulate the app from changes in the data model and
can contain complex business logic.

### Provider package

This app makes use of the provider package to easily separate presentation
logic from application level logic. This could have also been implemented
using `InheritedWidget` but that would mean implementing a lot of low level
code which Provider gives out of the box. Most decent sized apps use Provider
or a similar package (e.g. Bloc, Riverpod, etc.) to manage their state. But it
is definitely possible to implement this state management yourself.

### Code style choices

This project only makes use of absolute imports. This is actually against the
official **Dart style guide**. Popular linting packages started arguing for
absolute import for easier refactoring. I also agree with this argument and
therefore also use only absolute imports.

Linting is based on the `very_good_analysis` package. I find that this package
has a linting configuration I strongly agree with. And if for good reason I
would want to diverge from there rules then that is possible.
