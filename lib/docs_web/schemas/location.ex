defmodule DocsWeb.Schemas.Location do
  alias OpenApiSpex.Schema

  require OpenApiSpex

  OpenApiSpex.schema(%{
    title: "An Arta Location",
    type: :object,
    properties: %{
      access_restrictions: %Schema{
        type: :array,
        deprecated: true,
        items: %Schema{
          type: :string,
          description: "Id of location restriction type"
        }
      },
      address_line_1: %Schema{
        type: :string,
        description: "First line of address",
        example: "87 Richardson St"
      },
      address_line_2: %Schema{
        type: :string,
        description: "Second line of address",
        nullable: true
      },
      address_line_3: %Schema{
        type: :string,
        description: "Third line of address",
        nullable: true
      },
      city: %Schema{
        type: :string,
        description: "City",
        example: "Brooklyn"
      },
      country: %Schema{
        type: :string,
        maxLength: 2,
        minLength: 2,
        description: "The ISO 3166-1 alpha-2 country code of the current or last known location if available",
        required: true,
        example: "US"
      },
      postal_code: %Schema{
        type: :string,
        description: "The postal code",
        example: "11211"
      },
      region: %Schema{
        type: :string,
        description: "Political region name, for US states and Canada provinces, use 2 letter abbreviations",
        example: "NY"
      },
      title: %Schema{
        type: :string,
        description: "The title or name of the location",
        example: "Gallery"
      },
      contacts: %Schema{
        type: :array,
        description: "A list of contacts at the location",
        items: %Schema{
          type: :object,
          properties: %{
            name: %Schema{
              type: :string,
              example: "Contact Name"
            },
            email_address: %Schema{
              type: :string,
              example: "docs@arta.io"
            },
            phone_number: %Schema{
              type: :string,
              example: "646 828 7333"
            }
          },
          required: ["name"]
        }
      }
    },
  })
end
