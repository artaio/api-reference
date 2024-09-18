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

  alias DocsWeb.Schemas.{APIKey, Response}
  alias DocsWeb.Parameters.{Authorization, Page, PageSize}
  alias DocsWeb.Schemas.RequestBody.{HostedSessionCreate, ShipmentCreate}
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
                  list(Response.HostedSession)
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
                  Response.HostedSession
                )
            }
          }
        },
        "/shipments" => %PathItem{
          post: %Operation{
            summary: "Create a Shipment",
            description:
              "This endpoint is used for two purposes:\n\n**1. Generating standard Arta shipments**\n\nAll [standard shipments](https://manual.arta.io/guides/logistics/workflow) are actively facilitated by Arta. Working in tandem with our extensive logistics carrier network, Arta fulfills shipments with `Premium`, `Select`, and `Parcel` quote types from scheduling collection, to coordinating packing, through delivery. For shipments with the `Self Ship` quote type, Arta will generate labels on your behalf with commercial carriers such as FedEx, UPS, and DHL.\n\nTo book a standard Arta shipment, you must first create a shipping quote request. You can then use a `quote_id` returned by the quote request endpoint to create the shipment.\n\n**2. Generating Track shipments**\n\n[Track shipments](https://manual.arta.io/guides/solutions/no-code/post-sale/tracking/track) provide a similar customer tracking and notification experience as standard Arta shipments but for shipments you have booked with commercial carriers outside of the Arta platform.\n\nTo create a Track shipment, you provide the `carrier` and `tracking_number` purchased externally and the Arta platform provides status automation, tracking pages, and customer notifications. You may optionally provide additional supplementary information such as origin, destination, and package details for Track shipments.\n\n_Note that Track shipments are a beta feature. Please contact your account manager or hello@arta.io to request access for your organization._",
            tags: [
              "shipments"
            ],
            operationId: "shipments/create",
            parameters: [Authorization.parameter()],
            requestBody: %RequestBody{
              content: %{
                "application/json" => %MediaType{
                  schema: ShipmentCreate
                }
              }
            },
            responses: %{
              200 =>
                Operation.response(
                  "The created shipment",
                  "application/json",
                  Response.Shipment
                ),
              403 =>
                Operation.response(
                  "Forbidden",
                  "application/json",
                  nil
                ),
              404 =>
                Operation.response(
                  "Object not found",
                  "application/json",
                  nil
                ),
              422 =>
                Operation.response(
                  "Unprocessible entity",
                  "application/json",
                  Response.Error
                )
            }
          }
        },
        "/api_keys" => %PathItem{
          get: %Operation{
            description:
              "Retrieve a paginated collection of API Keys belonging to your Organization",
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
