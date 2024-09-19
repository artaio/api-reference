defmodule DocsWeb.Schemas.RequestBody.HostedSessionCreate do
  alias OpenApiSpex.Schema
  alias DocsWeb.Schemas.Payload.{Location, Object}

  require OpenApiSpex

  OpenApiSpex.schema(%Schema{
    title: "HostedSessionCreate",
    oneOf: [
      %Schema{
        title: "BookingSession",
        description: "Create hosted booking session",
        type: :object,
        properties: %{
          additional_services: %Schema{
            type: "array",
            description:
              "Any desired services, such as unpacking, installation, etc. can be sent through in the request and will be treated as if that requested service is required, meaning this may disqualify certain segments of shipping services we offer.",
            items: %Schema{
              type: "string",
              description: "The id of a service.",
              example: "signature_delivery"
            }
          },
          cancel_url: %Schema{
            type: "string",
            description:
              "The URL the user will be redirected to after a Arta Booking session is cancelled",
            example: "http://example.com/cancelled"
          },
          destination: Location.call(),
          insurance: %Schema{
            type: "string",
            description:
              "The ID of the requested Arta insurance type. Options are defined in the Insurances metadata endpoint",
            example: "arta_transit_insurance"
          },
          internal_reference: %Schema{
            type: "string",
            description:
              "This field can be used to pass through any data that you may want returned unaltered for your own later usage",
            maxLength: 255,
            example: "Purchase Order: 2801"
          },
          objects: %Schema{
            type: "array",
            items: Object.call()
          },
          origin: Location.call(),
          preferred_quote_types: %Schema{
            type: "array",
            description:
              "Optionally instruct the Arta API to return a subset of quote types for the requests generated through this hosted session. For example if you would prefer to only return Select quotes, you can set this field to `[\"select\"]` The list valid quote type IDs are available at the /metadata/quotes endpoint.",
            example: [
              "parcel"
            ],
            nullable: true,
            items: %Schema{
              type: "string"
            }
          },
          public_reference: %Schema{
            description:
              "A client defined name for the request. The value provided for the public_reference field may appear in notification emails and shipment detail pages",
            type: "string",
            maxLength: 255,
            example: "Order #1437"
          },
          shipping_notes: %Schema{
            type: "string",
            description:
              "This field can be used to pass through any notes to Arta that a customer might want to provide about the request",
            example: "New customer"
          },
          success_url: %Schema{
            type: "string",
            description:
              "The URL the user will be redirected to after a Arta Booking session is completed",
            example: "http://example.com/success"
          }
        }
      },
      %Schema{
        title: "ShareRequest",
        type: :object,
        description: "Create hosted booking session from an existing quote request",
        properties: %{
          request_id: %Schema{
            type: :string,
            description: "The ID of an existing Request to be shared."
          }
        }
      }
    ]
  })
end
