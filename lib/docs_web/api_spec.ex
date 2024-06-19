defmodule DocsWeb.ApiSpec do

  alias OpenApiSpex.{
    Components,
    Info,
    OpenApi,
    Schema,
    Server,
    Operation,
    PathItem,
    SecurityScheme
  }

  alias DocsWeb.Schemas.{ApiKey, HostedSession}
  alias DocsWeb.Parameters.{Authorization, Page, PageSize}
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
        "/hosted_sessions" => %PathItem{
          get: %Operation{
            description:
              "Retrieve a paginated collection of hosted sessions belonging to your organization",
            operationId: "hostedSessions/list",
            summary: "List Hosted Sessions",
            tags: [
              "hosted_sessions"
            ],
            parameters: [Authorization.parameter(), Page.parameter(), PageSize.parameter()],
            responses: %{
              200 =>
                Operation.response(
                  "A paginated collection of hosted sessions",
                  "application/json",
                  list(HostedSession)
                )
            }
          },
          # post: %Operation{

          # }
        }
      }
    }
    # Discover request/response schemas from path specs
    |> OpenApiSpex.resolve_schema_modules()
  end

  defp list(type) do
    %Schema{
      type: "object",
      properties: %{
        items: %Schema{
          type: "array",
          items: type
        },
        metadata: %Schema{
          type: "object",
          properties: %{
            page: %Schema{
              type: "integer",
              format: "int64",
              example: 1,
              readOnly: true
            },
            page_size: %Schema{
              type: "integer",
              format: "int64",
              example: 20,
              readOnly: true
            },
            total_count: %Schema{
              type: "integer",
              format: "int64",
              example: 1,
              readOnly: true
            }
          }
        }
      }
    }
  end

end
