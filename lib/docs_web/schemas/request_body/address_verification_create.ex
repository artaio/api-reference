defmodule DocsWeb.Schemas.RequestBody.AddressVerificationCreate do
  alias OpenApiSpex.Schema

  require OpenApiSpex

  OpenApiSpex.schema(%Schema{
    title: "AddressVerificationCreate",
    type: :object,
    properties: %{
      address_verification: %Schema{
        type: :object,
        required: ["input"],
        properties: %{
          input: %Schema{
            type: :object,
            required: ["address_line_1", "country"],
            properties: %{
              address_line_1: %Schema{
                type: :string,
                description: "Primary street address",
                example: "123 Main St"
              },
              address_line_2: %Schema{
                type: :string,
                description: "Secondary address (apartment, suite, etc.)",
                nullable: true
              },
              address_line_3: %Schema{
                type: :string,
                description: "Tertiary address line",
                nullable: true
              },
              city: %Schema{
                type: :string,
                description: "City or locality",
                nullable: true,
                example: "New York"
              },
              region: %Schema{
                type: :string,
                description: "State, province, or region",
                nullable: true,
                example: "NY"
              },
              postal_code: %Schema{
                type: :string,
                description: "Postal or ZIP code",
                nullable: true,
                example: "10001"
              },
              country: %Schema{
                type: :string,
                description: "ISO 3166-1 alpha-2 country code",
                example: "US"
              }
            }
          },
          reference: %Schema{
            type: :string,
            description: "Your own reference ID for correlation",
            nullable: true,
            example: "order-12345"
          }
        }
      }
    },
    required: ["address_verification"],
    additionalProperties: false
  })
end
