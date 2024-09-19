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

  alias DocsWeb.Parameters
  alias DocsWeb.Schemas.{APIKey, Response}
  alias DocsWeb.Parameters.{Authorization, Page, PageSize}
  alias DocsWeb.Schemas.RequestBody.{AttachmentCreate, HostedSessionCreate, ShipmentCreate}
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
        },
        "/attachments" => %PathItem{
          get: %Operation{
            summary: "List Attachments",
            description:
              "Retrieve a paginated collection of Attachment records belonging to your Organization",
            tags: [
              "attachments"
            ],
            operationId: "attachments/list",
            parameters: [Authorization.parameter(), Page.parameter(), PageSize.parameter()],
            responses: %{
              200 =>
                Operation.response(
                  "A collection of Attachment records",
                  "application/json",
                  list(Response.Attachment)
                )
            }
          },
          post: %Operation{
            summary: "Create an Attachment",
            description:
              "The attachment resource connects uploads on Arta to shipment or request resources. Attached uploads are visible in the Arta Dashobard under the \"Documents\" tab on the shipment and request detail pages.\n\nEach upload may be attached to many requests or shipments. Each request or shipment may have many associated uploads.\n\nTo create an attachment via the API you can must send an authenticated request to the `POST /attachments` endpoint with a body that includes one of two different payload schema.\n\nTo attach an upload to a shipment, the attachment payload must include `upload_id` and `shipment_id` attributes. This payload must not include a `request_id` attribute. For example:\n\n```json\n{\n    \"attachment\": {\n        \"shipment_id\": \"506d79b6-1e5e-4e8c-a266-74658fdaf4ee\",\n        \"upload_id\": 5285\n    }\n}\n```\n\nTo attach an upload to a request, the attachment payload must include `upload_id` and `request_id` attributes. This payload must not include a `shipment_id` attribute. For example:\n\n```json\n{\n    \"attachment\": {\n        \"request_id\": \"506d79b6-1e5e-4e8c-a266-74658fdaf4ee\",\n        \"upload_id\": 5285\n    }\n}\n```",
            tags: [
              "attachments"
            ],
            operationId: "attachments/create",
            parameters: [Authorization.parameter()],
            requestBody: %RequestBody{
              content: %{
                "application/json" => %MediaType{
                  schema: AttachmentCreate
                }
              }
            },
            responses: %{
              200 =>
                Operation.response(
                  "The created attachment",
                  "application/json",
                  Response.Attachment
                )
            }
          }
        },
        "/attachments/{attachment_id}" => %PathItem{
          get: %Operation{
            summary: "Retrieve an Attachment",
            description: "Retrieve an existing Attachment",
            tags: [
              "attachments"
            ],
            operationId: "attachments/get",
            parameters: [Authorization.parameter(), Parameters.AttachmentID.parameter()],
            responses: %{
              200 =>
                Operation.response(
                  "Successful Attachment get response",
                  "application/json",
                  Response.Attachment
                ),
              404 =>
                Operation.response(
                  "Object not found",
                  "application/json",
                  nil
                )
            }
          },
          delete: %Operation{
            summary: "Delete an Attachment",
            description: "Delete an existing Attachment",
            tags: [
              "attachments"
            ],
            operationId: "attachments/delete",
            parameters: [Authorization.parameter(), Parameters.AttachmentID.parameter()],
            responses: %{
              204 =>
                Operation.response(
                  "Attachment deleted",
                  "application/json",
                  nil
                ),
              404 =>
                Operation.response(
                  "Object not found",
                  "application/json",
                  nil
                )
            }
          }
        },
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
          get: %Operation{
            summary: "List Shipment records",
            description:
              "Retrieve a paginated collection of Shipment records belonging to your Organization",
            tags: [
              "shipments"
            ],
            operationId: "shipments/list",
            parameters: [Authorization.parameter()],
            responses: %{
              200 =>
                Operation.response(
                  "A collection of Shipment records",
                  "application/json",
                  list(Response.ShipmentList)
                )
            }
          },
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
        "/shipments/{shipment_id}" => %PathItem{
          get: %Operation{
            summary: "Retrieve a Shipment record",
            description: "Retrieve an existing Shipment record",
            tags: [
              "shipments"
            ],
            operationId: "shipments/get",
            parameters: [Authorization.parameter(), Parameters.ShipmentID.parameter()],
            responses: %{
              200 =>
                Operation.response(
                  "Successful Shipment get response",
                  "application/json",
                  Response.Shipment
                ),
              404 =>
                Operation.response(
                  "Object not found",
                  "application/json",
                  nil
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
