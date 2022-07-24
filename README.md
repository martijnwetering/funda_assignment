# Funda Assignment

## Description app

This app consists of two pages, a search page and a details page.
A user can enter a place or neighborhood and on pressing search
will be presented with a list of search results. Each result can
be selected to view it's details.

*Note: paging is not implemented due to time restrictions.*

## How to get started

The app should should be able to run directly after is has been
cloned to a local development environment and packages are 
installed with `flutter pub get`. **Code generation** is
used to generate the JSON encoding and decoding of the models,
but this generated code is also committed to the repository.

## Architecture

The source code is divided over three layers. **Presentation** contains
all widgets and UI logic. Pages are at the root of the folder with
there widgets in the widgets sub folder.

Each page has it's own **provider**. Providers act as the **application**
layer and orchestrate use cases. In a simple app as this they just
fetch data and contain the state for the presentation layer.

Providers make use of the **infrastructure** layer that actually retrieves
the data and provides the models. This way the application layer does not
need to worry where the data comes from, it can just ask for it.

## Testing

The project contains 2 integration style tests for demonstration
purposes. To mock the server calls `Mockito` is used. This package
works with **code generation** to generate mocks. The generated
mocks can be configured in code.

### Code style choices

This project only makes use of absolute imports. This is actually against the
official **Dart style guide**. Current debate in the community started arguing for
absolute imports for easier refactoring. This actually makes sense and therefore
absolute imports are used.

Linting rules come from the `very_good_analysis` package. Personally I find this
a very good rule set. One adjustment is made, `public_member_api_docs` is set to 
`false`. I find it a bit redundant to comment every public class and constructor
in a closed source project.
