defmodule DocsWeb.Schemas.Response.RequestListItem do
  alias OpenApiSpex.Schema

  require OpenApiSpex

  OpenApiSpex.schema(%{
    title: "RequestListItem",
    type: :object,
    properties: %{
      bookable: %Schema{
        type: "object",
        description: "Communicates whether the quotes generated for this request may be booked into shipments",
        properties: %{
          missing: %Schema{
            type: "array",
            description: "A list of fields required for the request to be bookable",
            items: %Schema{
              type: "string"
            }
          },
          ready: %Schema{
            type: "boolean",
            default: true,
            description: "Returns true if the quotes in this request may be booked"
          }
        }
      },
      created_at: %Schema{
        type: "string",
        example: "2021-01-21T21:00:58.403150",
        description:
          "A NaiveDatetime-formatted timestamp describing when the resource was created with microsecond precision "
      },
      destination: %Schema{
        type: "object",
        description: "A minimal representation of the destination address for the request",
        additionalProperties: false,
        properties: %{
          city: %Schema{
            type: "string",
            description: "The destination address city",
            example: "Los Angeles",
            nullable: true
          },
          country: %Schema{
            type: "string",
            description: "The destination address country in 2-digit ISO 3166-1 alpha-2 format",
            example: "US"
          },
          postal_code: %Schema{
            type: "string",
            description: "The destination address postal code",
            example: "90024",
            nullable: true
          },
          region: %Schema{
            type: "string",
            description: "The destination address region",
            example: "CA",
            nullable: true
          }
        }
      },
      hosted_session_id: %Schema{
        type: "integer",
        description: "The ID of the HostedSession through which this request was created\n\n",
        example: 4215,
        nullable: true
      },
      id: %Schema{
        type: "string",
        description: "The ID for this request",
        example: "748dd2cd-f299-446d-8e6e-19b33aa72a83"
      },
      insurance: %Schema{
        type: "string",
        description:
          "This field can be used to pass through any character data that you may want returned unaltered for your own later usage",
        example: "arta_transit_insurance",
        enum: [nil, "arta_transit_insurance"],
        nullable: true
      },
      internal_reference: %Schema{
        type: "string",
        description:
          "This field can be used to pass through any character data that you may want returned unaltered for your own later usage",
        example: "cart #425123; user #871",
        nullable: true
      },
      log_request_id: %Schema{
        type: "string",
        description: "An identifier for the API call that created this resource",
        example: "Fv9YnUGcBW9ozqgA2s_x",
        nullable: true
      },
      object_count: %Schema{
        type: "integer",
        description: "The count of objects in this request",
        example: 1
      },
      origin: %Schema{
        type: "object",
        description: "A minimal representation of the origin address for the request",
        properties: %{
          city: %Schema{
            type: "string",
            description: "The origin address city",
            example: "Brooklyn",
            nullable: true
          },
          country: %Schema{
            type: "string",
            description: "The origin address country in 2-digit ISO 3166-1 alpha-2 format",
            example: "US"
          },
          postal_code: %Schema{
            type: "string",
            description: "The origin address postal code",
            example: "11211",
            nullable: true
          },
          region: %Schema{
            type: "string",
            description: "The origin address region",
            example: "NY",
            nullable: true
          }
        }
      },
      public_reference: %Schema{
        type: "string",
        description:
          "A client defined name for the resource. The value provided for the public_reference field may appear in notification emails and public web pages",
        example: "Order #56812",
        nullable: true
      },
      quote_types: %Schema{
        description: "The IDs of the quote types generated for this request",
        type: "array",
        items: %Schema{
          type: "string",
          enum: ["parcel", "premium", "select", "self_ship"]
        }
      },
      quoting_strategy: %Schema{
        type: "string",
        description:
          "TThe quoting strategy used when creating quotes for this request. Determines whether the API returns a single best-rate option per transport speed or multiple carrier options for comparison. If not specified, the default strategy (“best_rate”) will be applied.",
        maxLength: 255,
        example: "best_rate",
        enum: ["best_rate", "compare_carriers"]
      },
      shortcode: %Schema{
        type: "string",
        example: "DEMO-R723LA",
        description: "A brief string identifier for this shipment"
      },
      status: %Schema{
        type: "string",
        example: "quoted",
        description: "The status for this shipment",
        enum: [
          "quoted",
          "in_progress",
          "closed",
          "disqualified",
          "expired",
          "cancelled",
          "pending"
        ]
      },
      tags: %Schema{
        type: :array,
        description: "A list of tags associated with this request",
        items: DocsWeb.Schemas.Response.Tag
      },
      updated_at: %Schema{
        type: "string",
        description:
          "A NaiveDatetime-formatted timestamp describing when the resource was last updated with microsecond precision ",
        example: "2021-01-21T21:00:58.403150"
      }
    },
    example: %{
      "bookable" => %{
        "missing" => [],
        "ready" => true
      },
      "created_at" => "2021-01-21T21:00:29.568665",
      "destination" => %{
        "city" => "New York",
        "country" => "US",
        "postal_code" => "11249",
        "region" => "NY"
      },
      "hosted_session_id" => 724,
      "id" => "6b12c76a-5217-4cd6-82d8-7aa5265ebaad",
      "insurance" => nil,
      "internal_reference" => nil,
      "object_count" => 1,
      "origin" => %{
        "city" => "New York",
        "country" => "US",
        "postal_code" => "10019",
        "region" => "NY"
      },
      "public_reference" => nil,
      "quote_types" => ["parcel", "select", "premium"],
      "quoting_strategy" => "best_rate",
      "shortcode" => "DEMO-R29NAW",
      "status" => "closed",
      "tags" => [],
      "updated_at" => "2021-01-21T21:00:58.484566"
    }
  })
end
