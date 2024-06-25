defmodule DocsWeb.ApiSpec do
  alias OpenApiSpex.{
    Info,
    OpenApi,
    Schema,
    Server,
    MediaType,
    Operation,
    PathItem,
    RequestBody
  }

  alias DocsWeb.Schemas.{APIKey, HostedSession}
  alias DocsWeb.Parameters.{Authorization, Page, PageSize}
  alias DocsWeb.Schemas.RequestBody.HostedSessionCreate
  @behaviour OpenApi

  @impl OpenApi
  def spec do
    %OpenApi{
      openapi: "3.1.0",
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
          post: %Operation{
            summary: "Create a Hosted Session",
            description:
              "Create a hosted session resource to generate an Arta Booking url.\n\nThis endpoint expects one of two versions of the `hosted_session` schema:\n\n* You may send a `hosted_session` object with a subset of the fields required for generating quote requests via the Arta API. With this schema, you must minimally include valid `objects` and `origin` details in your API call. Additionally, you may provide a `success_url` and a `cancel_url` to determine where Arta will redirect the user after the session is complete\n\n* Alternatively, you may share an existing Quote Request by sending a `hosted_session` object with the corresponding request's `request_id`. This will create an Arta Booking session for the request\n\nUse the private `url` in the successful hosted session response to direct your users to the Arta Booking web page so that they may configure and book their own shipment.",
            tags: [
              "hosted_sessions"
            ],
            operationId: "hostedSessions/create",
            parameters: [Authorization.parameter()],
            requestBody: %RequestBody{
              content: %{
                "application/json" => %MediaType{
                  schema: HostedSessionCreate
                }
              }
            },
            responses: %{
              200 =>
                Operation.response(
                  "the created hosted sessions",
                  "application/json",
                  HostedSession
                )
            }
          }
        },
        "/api_keys" => %PathItem{
          get: %Operation{
            description: "Retrieve a paginated collection of API Keys belonging to your Organization",
            operationId: "apiKeys/list",
            summary: "List API Keys",
            tags: [
              "api_keys"
            ],
            parameters: [Authorization.parameter(), Page.parameter(), PageSize.parameter()],
            responses: %{
              200 =>
                Operation.response(
                  "A succesful collection of API Keys associated with your organization",
                  "application/json",
                  list(APIKey)
                )
            }
          }
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
