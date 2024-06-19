defmodule DocsWeb.Schemas.NullableLocation do
  alias OpenApiSpex.Schema

  require OpenApiSpex

  OpenApiSpex.schema(%{
    title: "nullableLocation",
    type: :object,
    properties: %{
      id: %Schema{
        type: :string,
        readOnly: true,
        description: "The location id"
      },
      address_line_1: %Schema{
        type: :string,
        description: "First line of address"
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
        description: "City"
      },
      region: %Schema{
        type: :string,
        description: "Political region name, for US states and Canada provinces, use 2 letter abbreviations"
      },
      postal_code: %Schema{
        type: :string,
        description: "The postal code"
      },
      country: %Schema{
        type: :string,
        maxLength: 2,
        minLength: 2,
        description: "The ISO 3166-1 alpha-2 country code of the current or last known location if available"
      },
      title: %Schema{
        type: :string,
        description: "The title or name of the location"
      },
      access_restrictions: %Schema{
        type: :array,
        items: %Schema{
          type: :string,
          description: "Id of location restriction type"
        }
      },
      contacts: %Schema{
        type: :array,
        description: "A list of contacts at the location",
        items: %Schema{
          type: :object,
          properties: %{
            name: %Schema{
              type: :string
            },
            email_address: %Schema{
              type: :string
            },
            phone_number: %Schema{
              type: :string
            }
          }
        }
      }
    },
    nullable: true
  })
end
