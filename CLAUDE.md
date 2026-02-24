# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is the Arta API Reference — an Elixir project that generates the OpenAPI 3.1.0 specification for the Arta Public API. It uses [OpenAPI Spex](https://github.com/open-api-spex/open_api_spex) to define schemas and endpoints, compiles them to `openapi.json`, and deploys documentation via Bump.sh to [api-reference.arta.io](https://api-reference.arta.io/).

## Commands

```bash
mix deps.get          # Install Elixir dependencies
bin/run               # Generate openapi.json (uses mix openapi.spec.json + jq for sorting)
bin/server            # Generate spec + start Scalar API Client preview server
bin/lint              # Format Elixir code (mix format)
bin/lint-check        # Check formatting (mix format --check-formatted) + style (mix credo)
bin/build-static      # Generate spec + build React visualization for deployment
```

The visualization app in `visualization/` uses React + Vite + Scalar API Reference:
```bash
cd visualization && npm ci && npm run build   # Build static visualization
cd visualization && npm run dev               # Vite dev server
```

## Architecture

### Spec Generation Flow

Elixir schema modules → `mix openapi.spec.json --spec DocsWeb.ApiSpec` → `openapi.json` (sorted via jq) → deployed to Bump.sh

### Code Structure

- **`lib/docs_web/api_spec.ex`** — Central file defining all API endpoints, operations, and the OpenAPI spec structure. This is the main entry point (~2000 lines). All path items and operations are defined here.
- **`lib/docs_web/schemas/`** — Schema modules using `OpenApiSpex.schema/1` macro:
  - `response/` — Response schemas (e.g., `Response.Shipment`, `Response.Request`)
  - `response/metadata/` — Metadata sub-schemas for responses
  - `request_body/` — Request payload schemas (e.g., `RequestBody.ShipmentCreate`)
  - `payload/` — Shared payload definitions
  - Top-level: `api_key.ex`, `currency.ex`, `fields.ex`, `monetary_amount.ex`, `minimal_location.ex`
- **`lib/docs_web/parameters/`** — Query/path parameter definitions (Authorization, Page, PageSize, Search, etc.)
- **`lib/docs_web/headers/`** — Response header definitions
- **`visualization/`** — React app that renders the spec using Scalar API Reference component

### Schema Pattern

All schemas follow this pattern with `OpenApiSpex.schema/1`:

```elixir
defmodule DocsWeb.Schemas.Response.SomeResource do
  alias OpenApiSpex.Schema
  require OpenApiSpex

  OpenApiSpex.schema(%{
    title: "SomeResource",
    type: :object,
    properties: %{
      id: %Schema{type: :string, description: "..."}
    },
    required: [:id]
  })
end
```

## Code Style

- Elixir formatter: 120 character line length (`.formatter.exs`)
- Credo for style analysis (`.credo.exs`): ModuleDoc check is disabled
- Run `bin/lint` before committing to auto-format

## CI/CD

GitHub Actions (`build-deploy.yml`) runs on push to `master` and PRs:
- Installs Erlang/OTP + Elixir via `erlef/setup-beam`
- Runs `bin/build-static` to generate spec and build visualization
- PRs: deploys preview to Cloudflare Pages
- Master: deploys spec to Bump.sh
