defmodule DocsWeb.Schemas.Response.Service do
  alias OpenApiSpex.Schema

  alias DocsWeb.Schemas.{Currency, MonetaryAmount}

  require OpenApiSpex

  OpenApiSpex.schema(%{
    title: "Service",
    type: :object,
    properties: %{
      amount: MonetaryAmount,
      amount_currency: Currency,
      included_services: %Schema{
        type: "array",
        description: "A list of service IDs that are included in the service",
        items: %Schema{
          type: "object",
          properties: %{
            name: %Schema{
              type: "string",
              description: "The name of the service",
              example: "Consolidated Trucking"
            },
            sub_subtype: %Schema{
              type: "string",
              description:
                "The service subsubtype ID. Options are defined in the Service types metadata endpoint",
              pattern: "^[0-9a-z_]{1,56}$",
              example: "road_groupage"
            },
            subtype: %Schema{
              type: "string",
              description:
                "The service subtype ID. Options are defined in the Service types metadata endpoint",
              pattern: "^[0-9a-z_]{1,56}$",
              example: "consolidated"
            },
            type: %Schema{
              type: "string",
              description:
                "The service type ID. Options are defined in the Service types metadata endpoint",
              pattern: "^[0-9a-z_]{1,56}$",
              example: "transport"
            }
          }
        }
      },
      is_requested: %Schema{
        type: "boolean",
        description: "Set this flag to true if the service is requested"
      },
      is_required: %Schema{
        type: "boolean",
        description: "Set this flag to true if the service is required"
      },
      name: %Schema{
        type: "string",
        description: "The name of the service",
        example: "Consolidated Trucking"
      },
      sub_subtype: %Schema{
        type: "string",
        description:
          "The service subsubtype ID. Options are defined in the Service types metadata endpoint",
        pattern: "^[0-9a-z_]{1,56}$",
        example: "road_groupage"
      },
      subtype: %Schema{
        type: "string",
        description:
          "The service subtype ID. Options are defined in the Service types metadata endpoint",
        pattern: "^[0-9a-z_]{1,56}$",
        example: "consolidated"
      },
      type: %Schema{
        type: "string",
        description:
          "The service type ID. Options are defined in the Service types metadata endpoint",
        pattern: "^[0-9a-z_]{1,56}$",
        example: "transport"
      }
    }
  })
end
