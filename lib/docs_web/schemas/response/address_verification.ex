defmodule DocsWeb.Schemas.Response.AddressVerification do
  alias OpenApiSpex.Schema

  require OpenApiSpex

  OpenApiSpex.schema(%{
    title: "AddressVerification",
    type: :object,
    properties: %{
      id: %Schema{
        type: :string,
        description: "The id of the address verification in UUID format",
        format: :uuid
      },
      shortcode: %Schema{
        type: :string,
        description:
          "A human-readable identifier for the address verification prefixed with the organization's shortcode",
        example: "ACME-V1A2B3"
      },
      status: %Schema{
        type: :string,
        description: "The verification outcome",
        example: "success",
        enum: ["success", "partial", "failed"]
      },
      match_level: %Schema{
        type: :string,
        description: "The granularity of the address match, from most to least precise",
        example: "delivery_point",
        enum: ["delivery_point", "premise", "thoroughfare", "locality", "administrative_area", "none"]
      },
      reference: %Schema{
        type: :string,
        description: "An optional client-provided reference string for correlating with your own records",
        nullable: true,
        example: "order-12345"
      },
      input: %Schema{
        type: :object,
        description: "The original address as submitted",
        properties: %{
          address_line_1: %Schema{
            type: :string,
            description: "Primary street address line"
          },
          address_line_2: %Schema{
            type: :string,
            description: "Secondary address line (apartment, suite, unit, etc.)",
            nullable: true
          },
          address_line_3: %Schema{
            type: :string,
            description: "Tertiary address line. Used for some international formats",
            nullable: true
          },
          city: %Schema{
            type: :string,
            description: "City or locality name",
            nullable: true
          },
          region: %Schema{
            type: :string,
            description: "State, province, or region code",
            nullable: true
          },
          postal_code: %Schema{
            type: :string,
            description: "Postal or ZIP code",
            nullable: true
          },
          country: %Schema{
            type: :string,
            description: "ISO 3166-1 alpha-2 country code",
            example: "US"
          }
        }
      },
      recommendation: %Schema{
        type: :object,
        description:
          "The verified and corrected address with geocoding data. Fields may be null if verification failed",
        properties: %{
          address_line_1: %Schema{
            type: :string,
            description: "Corrected primary street address",
            nullable: true
          },
          address_line_2: %Schema{
            type: :string,
            description: "Corrected secondary address line",
            nullable: true
          },
          address_line_3: %Schema{
            type: :string,
            description: "Corrected tertiary address line",
            nullable: true
          },
          city: %Schema{
            type: :string,
            description: "Corrected city or locality",
            nullable: true
          },
          region: %Schema{
            type: :string,
            description: "Corrected state, province, or region",
            nullable: true
          },
          postal_code: %Schema{
            type: :string,
            description: "Corrected postal code. For US addresses, may include the +4 extension (e.g., `10001-1234`)",
            nullable: true
          },
          country: %Schema{
            type: :string,
            description: "ISO 3166-1 alpha-2 country code",
            example: "US"
          },
          latitude: %Schema{
            type: :number,
            format: :float,
            description: "Latitude coordinate of the verified address",
            nullable: true
          },
          longitude: %Schema{
            type: :number,
            format: :float,
            description: "Longitude coordinate of the verified address",
            nullable: true
          },
          is_residential: %Schema{
            type: :boolean,
            description:
              "Whether the address is classified as residential. US addresses only; null for international or when unknown",
            nullable: true
          }
        }
      },
      created_at: %Schema{
        type: :string,
        example: "2025-06-15T12:00:00.000000",
        description:
          "A NaiveDatetime-formatted timestamp describing when the resource was created with microsecond precision"
      },
      updated_at: %Schema{
        type: :string,
        example: "2025-06-15T12:00:00.000000",
        description:
          "A NaiveDatetime-formatted timestamp describing when the resource was last updated with microsecond precision"
      }
    },
    example: %{
      "id" => "a1b2c3d4-e5f6-7890-abcd-ef1234567890",
      "shortcode" => "ACME-V1A2B3",
      "status" => "success",
      "match_level" => "delivery_point",
      "reference" => "order-12345",
      "input" => %{
        "address_line_1" => "123 Main St",
        "address_line_2" => "Apt 4B",
        "address_line_3" => nil,
        "city" => "New York",
        "region" => "NY",
        "postal_code" => "10001",
        "country" => "US"
      },
      "recommendation" => %{
        "address_line_1" => "123 Main Street",
        "address_line_2" => "Apt 4B",
        "address_line_3" => nil,
        "city" => "New York",
        "region" => "NY",
        "postal_code" => "10001-1234",
        "country" => "US",
        "latitude" => 40.7128,
        "longitude" => -74.006,
        "is_residential" => true
      },
      "created_at" => "2025-06-15T12:00:00.000000",
      "updated_at" => "2025-06-15T12:00:00.000000"
    }
  })
end
