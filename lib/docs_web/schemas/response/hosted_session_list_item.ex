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
      can_user_confirm_object_dimensions: %Schema{
        type: "boolean",
        description:
          "Determines whether your customer can verify and update object dimension information when completing an inbound booking session."
      },
      created_at: %Schema{
        type: :string
      },
      destination: Response.NullableLocation,
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
      origin: Response.Location,
      payment_process: %Schema{
        type: :string,
        description:
          "The primary method by which payment to Arta will be handled for any shipment booked through this hosted session",
        example: "checkout",
        enum: ["checkout", "invoicing"],
        readOnly: true
      },
      preferred_parcel_transport_services: %Schema{
        type: "array",
        description:
          "Optionally instruct the Arta API to filter Parcel and Self Ship quotes for specific transport services. For example, if you would prefer to only return `ground` quotes, you can set this field to `[\"ground\"]` The list of valid transport service IDs is available at the /metadata/parcel_transport_services endpoint.",
        example: [
          "ground"
        ],
        nullable: true,
        items: %Schema{
          type: "string"
        }
      },
      preferred_quote_types: %Schema{
        type: :array,
        description:
          "An optional field presenting the list of quote types the caller instructed Arta to return as part of the hosted session",
        items: %Schema{
          type: :string
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
        description:
          "The quoting strategy used when creating quote requests for this booking session. Determines whether the API returns a single best-rate option per transport speed or multiple carrier options for comparison",
        type: "string",
        maxLength: 255,
        example: "best_rate",
        enum: [
          "best_rate",
          "compare_carriers"
        ],
        default: "best_rate"
      },
      shipping_notes: %Schema{
        type: :string,
        description:
          "This field can be used to pass through any notes to Arta that a customer might want to provide about the request",
        nullable: true
      },
      shortcode: %Schema{
        type: :string,
        description: "A brief and unique string identifier for the resource",
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
        type: "string",
        description: "The type of the hosted session"
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
      "can_user_confirm_object_dimensions" => false,
      "created_at" => "2021-01-21T17:22:08.818747",
      "destination" => nil,
      "id" => 42,
      "insurance" => nil,
      "internal_reference" => nil,
      "objects" => [
        %{
          "components" => [
            %{
              "customs" => %{
                "country_of_origin" => "US",
                "hs_code" => "123456",
                "medium" => "oil on canvas",
                "temporary_admission" => true
              },
              "details" => %{
                "creation_date" => "1980",
                "creator" => "Bob Smithson",
                "title" => "Black Rectangle",
                "notes" => "Artist signature in the lower left corner"
              },
              "id" => "1f26b6e1-ce25-43a9-b4ea-2ceaac24ec3a",
              "internal_reference" => "Accession ID: 823",
              "public_reference" => "Round Smithson work",
              "type" => "painting_framed",
              "value" => "15000",
              "value_currency" => "USD"
            }
          ],
          "current_packing" => ["cardboard_box"],
          "depth" => "2",
          "details" => %{
            "creation_date" => nil,
            "creator" => nil,
            "is_cites" => false,
            "is_fragile" => false,
            "materials" => [],
            "notes" => nil,
            "title" => nil
          },
          "height" => "10.5",
          "id" => 12346,
          "images" => [],
          "internal_reference" => nil,
          "public_reference" => nil,
          "subtype" => "prepacked_box",
          "type" => "client_package",
          "unit_of_measurement" => "in",
          "value" => "15000",
          "value_currency" => "USD",
          "weight" => "3.5",
          "weight_unit" => "lb",
          "width" => "10"
        },
        %{
          "components" => [],
          "current_packing" => [],
          "customs" => %{
            "country_of_origin" => "US",
            "hs_code" => "123456",
            "medium" => "oil on canvas",
            "temporary_admission" => true
          },
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
        "access_restrictions" => [],
        "address_line_1" => "11 W 53rd St",
        "address_line_2" => nil,
        "address_line_3" => nil,
        "city" => "New York",
        "contacts" => [
          %{
            "email_address" => "mary@example.com",
            "name" => "Mary Quinn Sullivan",
            "phone_number" => "(333) 333-3333"
          }
        ],
        "country" => "US",
        "postal_code" => "10019",
        "region" => "NY",
        "title" => "Warehouse"
      },
      "payment_process" => "invoicing",
      "preferred_quote_types" => [],
      "private_token" => "6f76b6e1-ce25-43a9-b4ea-2ceaac24ec7e",
      "public_reference" => nil,
      "quoting_strategy" => "best_rate",
      "shipping_notes" => nil,
      "shortcode" => "DEMO-BA9SVZ",
      "status" => "new",
      "type" => "booking",
      "success_url" => "http://example.com/success",
      "tags" => [],
      "updated_at" => "2021-01-21T17:22:10.129653",
      "url" => "https://book.arta.io/b/42/6f76b6e1-ce25-43a9-b4ea-2ceaac24ec7e"
    }
  })
end
