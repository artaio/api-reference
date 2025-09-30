defmodule DocsWeb.Schemas.RequestBody.CollectionTagRuleCreate do
  alias OpenApiSpex.Schema

  require OpenApiSpex

  OpenApiSpex.schema(%Schema{
    title: "CollectionTagRuleCreate",
    type: :object,
    properties: %{
      collection_tag_rule: %Schema{
        type: :object,
        oneOf: [
          %Schema{
            type: :object,
            required: [:pattern],
            properties: %{
              pattern: %Schema{
                type: :string,
                description:
                  "The pattern to match against shipment tags. For exact_match, this should be the exact tag name. For pattern_match, supports * wildcard.",
                maxLength: 100,
                example: "seller-a-*"
              }
            }
          },
          %Schema{
            type: :object,
            required: [:tag_id],
            properties: %{
              tag_id: %Schema{
                type: :uuid,
                description: "The ID of the tag to match against shipment tags.",
                example: "uuid"
              }
            }
          }
        ]
      }
    },
    example: %{
      "collection_tag_rule" => %{
        "pattern" => "seller-a-*"
      }
    }
  })
end
