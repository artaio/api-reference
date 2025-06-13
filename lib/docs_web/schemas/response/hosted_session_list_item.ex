defmodule DocsWeb.Schemas.Response.HostedSessionListItem do
  alias OpenApiSpex.Schema
  alias DocsWeb.Schemas.Response

  require OpenApiSpex

  OpenApiSpex.schema(%{
    title: "HostedSessionListItem",
    type: :object,
    properties: %{
      additional_services: %Schema{
        type: :array,
        description:
          "Any desired services, such as unpacking, installation, etc. can be sent through in the request and will be treated as if that requested service is required. Requested services may disqualify certain segments of shipping services offered by Arta depending on location and object details.",
        items: %Schema{
          type: :string,
          description: "The id of a service."
        }
      },
      cancel_url: %Schema{
        type: :string,
        description:
          "The URL the user will be redirected to after an Arta Booking session is cancelled"
      },
      created_at: %Schema{
        type: :string
      },
      destination: %Schema{
        type: "object",
        description: "A minimal representation of the destination address for the hosted session",
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
      id: %Schema{
        type: :integer,
        format: :int64
      },
      insurance: %Schema{
        type: :string,
        description:
          "The id of an insurance type. If requesting Arta insurance, object values must be provided.",
        example: "arta_transit_insurance",
        nullable: true
      },
      internal_reference: %Schema{
        type: :string,
        description:
          "This field can be used to pass through any data about the request you may want returned unaltered for your own later usage",
        maxLength: 255,
        nullable: true
      },
      objects: %Schema{
        type: "array",
        description: "A list of objects to be shipped",
        items: Response.Object
      },
      origin: %Schema{
        type: "object",
        description: "A minimal representation of the origin address for the hosted session",
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
      private_token: %Schema{
        type: :string,
        description:
          "A private access token for this resource. It is used to generate the private URL for the hosted session"
      },
      public_reference: %Schema{
        type: :string,
        description:
          "A client defined name for the resource. The value provided for the public_reference field may appear in notification emails and public web pages",
        maxLength: 255,
        nullable: true
      },
      quoting_strategy: %Schema{
        type: "string",
        description: "The quoting strategy used to generate the quotes in the hosted session",
        maxLength: 255,
        example: "best_rate",
        enum: ["best_rate", "compare_carriers"]
      },
      shipping_notes: %Schema{
        type: :string,
        description:
          "This field can be used to pass through any notes to Arta that a customer might want to provide about the request",
        nullable: true
      },
      shortcode: %Schema{
        type: :string,
        description: "A brief and unique string identifier for the request resource",
        example: "DEMO-B8FIRV"
      },
      status: %Schema{
        type: :string,
        example: "quoted"
      },
      success_url: %Schema{
        type: :string,
        description:
          "The URL the user will be redirected to after an Arta Booking session is completed"
      },
      tags: %Schema{
        type: :array,
        description: "A list of tags associated with this hosted session",
        items: DocsWeb.Schemas.Response.Tag
      },
      type: %Schema{
        type: :string,
        description: "The type of hosted session",
        example: "booking"
      },
      updated_at: %Schema{
        type: :string
      },
      url: %Schema{
        type: :string,
        description: "The Arta Booking web URL for this Hosted Session",
        nullable: true
      }
    },
    example: %{
      "additional_services" => ["signature_delivery"],
      "cancel_url" => "http://example.com/cancel",
      "created_at" => "2021-01-21T17:22:08.818747",
      "destination" => nil,
      "id" => 42,
      "insurance" => nil,
      "internal_reference" => nil,
      "objects" => [
        %{
          "current_packing" => [],
          "depth" => "2",
          "details" => %{
            "creation_date" => nil,
            "creator" => "Robert Irwin",
            "is_cites" => false,
            "is_fragile" => false,
            "materials" => [],
            "notes" => "notes",
            "title" => "It's just jazz"
          },
          "height" => "24",
          "id" => 12345,
          "images" => [],
          "internal_reference" => nil,
          "public_reference" => nil,
          "subtype" => "painting_unframed",
          "type" => "art",
          "unit_of_measurement" => "in",
          "value" => "100.00",
          "value_currency" => "USD",
          "weight" => "1",
          "weight_unit" => "lb",
          "width" => "36"
        }
      ],
      "origin" => %{
        "city" => "New York",
        "country" => "US",
        "postal_code" => "10019",
        "region" => "NY"
      },
      "private_token" => "6f76b6e1-ce25-43a9-b4ea-2ceaac24ec7e",
      "public_reference" => nil,
      "quoting_strategy" => "best_rate",
      "shipping_notes" => nil,
      "shortcode" => "DEMO-B49SVZ",
      "status" => "new",
      "success_url" => "http://example.com/success",
      "tags" => [],
      "type" => "booking",
      "updated_at" => "2021-01-21T17:22:10.129653",
      "url" => "https://book.arta.io/b/42/6f76b6e1-ce25-43a9-b4ea-2ceaac24ec7e"
    }
  })
end
