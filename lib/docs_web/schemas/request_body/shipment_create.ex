defmodule DocsWeb.Schemas.RequestBody.ShipmentCreate do
  alias DocsWeb.Schemas.Payload
  alias OpenApiSpex.Schema

  require OpenApiSpex

  OpenApiSpex.schema(%Schema{
    title: "ShipmentCreate",
    oneOf: [
      %Schema{
        title: "ArtaShipmentPayload",
        description: "Create a standard Arta shipment",
        type: :object,
        properties: %{
          internal_reference: %Schema{
            type: :string,
            description:
              "This field can be used to pass through any data that you may want returned unaltered for your own later usage",
            maxLength: 255,
            example: "Purchase Order: 2801"
          },
          public_reference: %Schema{
            description:
              "A client defined name for the request. The value provided for the public_reference field may appear in notification emails and shipment detail pages",
            type: "string",
            maxLength: 255,
            example: "Order #1437"
          },
          quote_id: %Schema{
            type: :integer,
            format: :int64,
            description: "The numeric id of the quote to be booked",
            example: "12345"
          },
          shipping_notes: %Schema{
            type: "string",
            description:
              "This field can be used to pass through any notes to Arta that a customer might want to provide about the request",
            maxLength: 255,
            example: "New customer"
          }
        },
        required: ["quote_id"],
        additionalProperties: false
      },
      %Schema{
        title: "TrackShipmentPayload",
        type: :object,
        description: "Create a track shipment",
        properties: %{
          tracking: %Schema{
            type: "array",
            description:
              "The tracking details for a shipment purchased off of the Arta platform. This information should come from a commercial carrier such as DHL, FedEx, or UPS. Exactly one item is required",
            items: %Schema{
              type: "object",
              properties: %{
                carrier: %Schema{
                  type: "string",
                  description:
                    "The id of a supported commercial carrier. These can be obtained via the GET /metadata/commercial_carriers endpoint",
                  example: "ups"
                },
                tracking_number: %Schema{
                  type: "string",
                  description:
                    "The tracking number of the shipment provided by the commercial carrier",
                  example: "1ZXXXXXXXXXXXXXXXX"
                },
                url: %Schema{
                  type: :string,
                  description:
                    "The url that links to the tracking page on the commercial carrier's website"
                }
              },
              required: ["carrier", "tracking_number"]
            }
          },
          internal_reference: %Schema{
            type: :string,
            description:
              "This field can be used to pass through any data that you may want returned unaltered for your own later usage",
            maxLength: 255,
            example: "Purchase Order: 2801"
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
              "This field can be used to provide Arta any additional context about the shipment",
            maxLength: 255,
            example: "New customer"
          },
          origin:
            Payload.NullableLocation.call(
              "The originating location for the shipment. If provided, the data in this object will overwrite the origin address data for this shipment that is stored on Arta's system, not the one on the commercial carrier's system"
            ),
          destination:
            Payload.NullableLocation.call(
              "The destination location for the shipment. If provided, the data in this object will overwrite the destination address data for this shipment that is stored on Arta's system, not the one on the commercial carrier's system"
            ),
          packages: %Schema{
            type: "array",
            items: Payload.Package.call(:track),
            description:
              "The shipments packages are formatted as a list, however, Track shipments only support a single package. You can provide details about the package being shipped, including the object details within the package"
          }
        },
        required: ["tracking"],
        additionalProperties: false
      }
    ]
  })
end
