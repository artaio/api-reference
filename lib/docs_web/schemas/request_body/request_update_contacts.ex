defmodule DocsWeb.Schemas.RequestBody.RequestUpdateContacts do
  alias OpenApiSpex.Schema

  require OpenApiSpex

  OpenApiSpex.schema(%Schema{
    title: "RequestUpdateContacts",
    type: :object,
    properties: %{
      destination: %Schema{
        type: :object,
        properties: %{
          contacts: %Schema{
            type: :array,
            items: %Schema{
              type: :object,
              properties: %{
                email_address: %Schema{
                  type: "string",
                  example: "destination@example.com",
                  description: "The email address for this contact"
                },
                name: %Schema{
                  type: "string",
                  example: "Destination Contact",
                  description: "The contact's name"
                },
                phone_number: %Schema{
                  type: "string",
                  example: "(310) 123-4567",
                  description: "The phone number for this contact"
                }
              },
              required: ["name"]
            }
          }
        }
      },
      origin: %Schema{
        type: :object,
        properties: %{
          contacts: %Schema{
            type: :array,
            items: %Schema{
              type: :object,
              properties: %{
                email_address: %Schema{
                  type: "string",
                  example: "origin@example.com",
                  description: "The email address for this contact"
                },
                name: %Schema{
                  type: "string",
                  example: "Origin Contact",
                  description: "The contact's name"
                },
                phone_number: %Schema{
                  type: "string",
                  example: "(310) 234-5678",
                  description: "The phone number for this contact"
                }
              },
              required: ["name"]
            }
          }
        }
      }
    },
    example: %{
      "destination" => %{
        "contacts" => [
          %{
            "email_address" => "destination@example.com",
            "name" => "Destination Contact",
            "phone_number" => "(310) 123-4567"
          }
        ]
      },
      "origin" => %{
        "contacts" => [
          %{
            "email_address" => "origin@example.com",
            "name" => "Origin Contact",
            "phone_number" => "(310) 234-5678"
          }
        ]
      }
    }
  })
end
