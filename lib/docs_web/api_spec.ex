defmodule DocsWeb.ApiSpec do
  alias OpenApiSpex.{Components, Info, OpenApi, Server, Operation, PathItem, Response, SecurityScheme, Reference}
  alias DocsWeb.{Endpoint, Router}
  alias DocsWeb.Schemas.ApiKey
  @behaviour OpenApi

  @impl OpenApi
  def spec do
    %OpenApi{
      servers: [
        # Populate the Server info from a phoenix endpoint
        %Server{
          url: "https://api.arta.io"
        }
      ],
      info: %Info{
        title: "Arta Public API",
        version: "1.0"
      },
      components: %Components{
        securitySchemes: %{"authorization" => %SecurityScheme{type: "https", scheme: "bearer"}}
      },
      # Populate the paths from a phoenix router
      paths: %{
        "/api_keys" => %PathItem{
          get: %Operation{
            description: "Retrieve a paginated collection of API Keys belonging to your Organization",
            operationId: "apiKeys/list",
            tags: [
              "api_keys"
            ],
            responses: %{
              200 => Operation.response(
                "A paginated collection of API Keys",
                "application/json",
                ApiKey
              )
            }
          },
          # post: %Operation{}
        }
      }
    }
    |> OpenApiSpex.resolve_schema_modules() # Discover request/response schemas from path specs
  end
end
