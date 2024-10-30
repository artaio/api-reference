# Arta API Reference

Welcome to the Arta API Reference repository. This project is designed to generate the Open API Specification (OAS) for the Arta API. It is built using Elixir and leverages the [Open API Spex library](https://github.com/open-api-spex/open_api_spex) to define and document the API specifications.

## Installing / Getting started

To run this project, you will need to install the following dependencies on your system:

- [Elixir](https://elixir-lang.org/install.html)
- [Scalar CLI](https://github.com/scalar/scalar?tab=readme-ov-file#cli)

## Generate the API specification

From the project root, run the following command in your terminal:

```shell
bin/run
```

## Running a development preview server

From the project root, run the following command in your terminal:

```shell
bin/server
```

This will generate the API specification and start a [Scalar API Client](https://github.com/scalar/scalar/blob/main/packages/api-client/README.md) server to preview the generated documentation.
