defmodule DocsWeb.Schemas.RequestBody.TestModeTransformationCreate do
  alias OpenApiSpex.Schema

  require OpenApiSpex

  OpenApiSpex.schema(%Schema{
    title: "TestModeTransformationCreate",
    type: :object,
    properties: %{
      test_mode_transformation: %Schema{
        type: :object,
        properties: %{
          type: %Schema{
            description: """
              The type of transformation to apply. Available types include:

              * `confirm` - Confirms a shipment, advancing it from pending to confirmed state
              * `collect` - Marks a shipment as collected from the origin location
              * `transit` - Updates a shipment to in-transit status
              * `complete` - Marks a shipment as completed/delivered
              * `cancel` - Cancels a shipment or request
              * `expire` - Expires a request that is no longer needed",
            """,
            type: :string,
            enum: ["confirm", "collect", "transit", "complete", "cancel", "expire"],
            example: "confirm"
          },
          resource_type: %Schema{
            description:
              "The type of resource to transform. Must be either `shipment` or `request`",
            type: :string,
            enum: ["shipment", "request"],
            example: "shipment"
          },
          resource_id: %Schema{
            description: "The ID of the shipment or request to transform",
            type: :string,
            example: "506d79b6-1e5e-4e8c-a266-74658fdaf4ee"
          }
        },
        required: ["type", "resource_type", "resource_id"]
      }
    },
    required: ["test_mode_transformation"],
    additionalProperties: false
  })
end
