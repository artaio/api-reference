defmodule DocsWeb.Schemas.RequestBody.RequestCreate do
  alias DocsWeb.Schemas.Payload.Object
  alias OpenApiSpex.Schema

  require OpenApiSpex

  OpenApiSpex.schema(%Schema{
    title: "RequestCreate",
    description: "Create a new request",
    type: :object,
    properties: %{
      request: %Schema{
        type: :object,
        required: ["destination", "objects", "origin"],
        properties: %{
          additional_services: %Schema{
            type: :array,
            description:
              "Any desired services, such as unpacking, installation, etc. can be sent through in the request and will be treated as if that requested service is required, meaning this may disqualify certain segments of shipping services we offer.",
            items: %Schema{
              type: :string,
              description: "The id of a service.",
              example: "origin_condition_check"
            }
          },
          currency: %Schema{
            default: "USD",
            description:
              "The currency that the quote should be returned in. Formatted as ISO 4217 three-letter alphabetic currency code. Options are defined in the Currencies metadata endpoint",
            pattern: "^[A-Z]{3}$",
            maxLength: 3,
            minLength: 3,
            type: :string,
            example: "USD"
          },
          destination: %Schema{
            description: "The destination location for the quote request",
            type: :object,
            required: ["postal_code", "country"],
            properties: %{
              access_restrictions: %Schema{
                type: :array,
                deprecated: true,
                description:
                  "A list of access restricition IDs describing physical properties for the location. Options are defined in the Location Access Restrictions metadata endpoint",
                items: %Schema{
                  type: :string,
                  example: "stairs_only"
                }
              },
              address_line_1: %Schema{
                type: :string,
                description: "The first line of the location's street address",
                maxLength: 255,
                example: "11 W 53rd St"
              },
              address_line_2: %Schema{
                description: "The second line of the location's street address",
                type: :string,
                maxLength: 255
              },
              address_line_3: %Schema{
                description: "The third line of the location's street address",
                type: :string,
                maxLength: 255
              },
              city: %Schema{
                type: :string,
                description: "The name of the city for the location",
                maxLength: 255,
                example: "New York"
              },
              region: %Schema{
                type: :string,
                description:
                  "Political region name, for US states and Canada provinces, use 2 letter abbreviations",
                maxLength: 255,
                example: "NY"
              },
              postal_code: %Schema{
                type: :string,
                description: "The postal code for the location",
                maxLength: 255,
                example: "10019"
              },
              country: %Schema{
                type: :string,
                description: "The ISO 3166-1 alpha-2 country code of the location",
                maxLength: 255,
                example: "US"
              },
              title: %Schema{
                type: :string,
                description: "The name for the location",
                maxLength: 255,
                example: "Gallery"
              },
              contacts: %Schema{
                type: :array,
                description: "The contact details for the location",
                items: %Schema{
                  type: :object,
                  properties: %{
                    name: %Schema{
                      type: :string,
                      description: "The contact's name",
                      example: "Mary Quinn Sullivan"
                    },
                    email_address: %Schema{
                      type: :string,
                      description: "The email address for this contact",
                      example: "mary@example.com"
                    },
                    phone_number: %Schema{
                      type: :string,
                      description: "The phone_number for this contact",
                      example: "(333) 333-3333"
                    }
                  },
                  required: ["name"]
                }
              }
            }
          },
          insurance: %Schema{
            type: :string,
            description:
              "The ID of the requested Arta insurance type. Options are defined in the Insurances metadata endpoint",
            example: "arta_transit_insurance"
          },
          internal_reference: %Schema{
            type: :string,
            description:
              "This field can be used to pass through any data that you may want returned unaltered for your own later usage",
            maxLength: 255,
            example: "Purchase Order: 2801"
          },
          objects: %Schema{
            type: "array",
            items: Object.call()
          },
          origin: %Schema{
            description: "The originating location for the quote request",
            type: :object,
            required: ["postal_code", "country"],
            properties: %{
              access_restrictions: %Schema{
                type: :array,
                deprecated: true,
                description:
                  "A list of access restricition ids describing physical properties of the location. Options are defined in the Location Access Restrictions metadata endpoint ",
                items: %Schema{
                  type: :string,
                  example: "non_paved"
                }
              },
              address_line_1: %Schema{
                type: :string,
                description: "The first line of the location's street address",
                maxLength: 255,
                example: "87 Richardson St"
              },
              address_line_2: %Schema{
                description: "The second line of the location's street address",
                type: :string,
                maxLength: 255
              },
              address_line_3: %Schema{
                description: "The third line of the location's street address",
                type: :string,
                maxLength: 255
              },
              city: %Schema{
                type: :string,
                description: "The name of the city for the location",
                maxLength: 255,
                example: "Brooklyn"
              },
              region: %Schema{
                type: :string,
                description:
                  "Political region name, for US states and Canada provinces, use 2 letter abbreviations",
                maxLength: 255,
                example: "NY"
              },
              postal_code: %Schema{
                type: :string,
                description: "The postal code for the location",
                maxLength: 255,
                example: "11249"
              },
              country: %Schema{
                type: :string,
                description: "The ISO 3166-1 alpha-2 country code of the location",
                maxLength: 255,
                example: "US"
              },
              title: %Schema{
                type: :string,
                description: "The name for the location",
                maxLength: 255,
                example: "Warehouse"
              },
              contacts: %Schema{
                type: :array,
                description: "The contact details for the location",
                items: %Schema{
                  type: :object,
                  properties: %{
                    name: %Schema{
                      type: :string,
                      description: "The contact's name",
                      example: "Rachel Egistrar"
                    },
                    email_address: %Schema{
                      type: :string,
                      description: "The main email address for this contact",
                      example: "registrar@example.com"
                    },
                    phone_number: %Schema{
                      type: :string,
                      description: "The main phone_number for this contact",
                      example: "(212) 123-4567"
                    }
                  },
                  required: ["name"]
                }
              }
            }
          },
          preferred_quote_types: %Schema{
            type: :array,
            description:
              "Optionally instruct the Arta API to return a subset of quote types for this request. For example if you would prefer to only return Select quotes for a particular request, you can set this field to `[\"select\"]` You can find all available quote type IDs at the /metadata/quotes endpoint.",
            items: %Schema{
              type: :string,
              example: "parcel"
            }
          },
          public_reference: %Schema{
            description:
              "A client defined name for the request. The value provided for the public_reference field may appear in notification emails and shipment detail pages",
            type: :string,
            maxLength: 255,
            example: "Order #1437"
          },
          shipping_notes: %Schema{
            type: :string,
            description:
              "This field can be used to pass through any notes to Arta that a customer might want to provide about the request",
            example: "New customer"
          },
          tags: %Schema{
            type: :array,
            description: "A list of tags to associate with this request",
            items: %Schema{
              type: :string,
              description: "The name of an active tag belonging to your organization.",
              example: "ny-warehouse"
            }
          }
        }
      }
    },
    required: ["request"]
  })
end
