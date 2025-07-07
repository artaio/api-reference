defmodule DocsWeb.Schemas.Response.CollectionTagRule do
  alias OpenApiSpex.Schema

  require OpenApiSpex

  OpenApiSpex.schema(%{
    type: :object,
    properties: %{
      id: %Schema{
        type: :string,
        description: "The ID of the collection tag rule in UUID format",
        format: :uuid,
        example: "f7e4b35b-5131-47c2-9a88-238bd6e62e2d"
      },
      pattern: %Schema{
        type: :string,
        description:
          "The pattern to match against shipment tags. For exact match, this should be the exact tag name. For pattern_match, supports * wildcard.",
        maxLength: 100,
        example: "seller-a-*"
      },
      tag_id: %Schema{
        type: :uuid,
        description:
          "The ID of the Tag this rule applies to. If provided, the rule will only apply to shipments with this tag.",
        example: "my-tag"
      },
      created_at: %Schema{
        type: :string,
        format: "date-time",
        example: "2024-08-13T22:44:39.593704",
        description:
          "A NaiveDatetime-formatted timestamp describing when the resource was created with microsecond precision"
      },
      updated_at: %Schema{
        type: :string,
        format: "date-time",
        example: "2024-08-13T22:44:39.593704",
        description:
          "A NaiveDatetime-formatted timestamp describing when the resource was last updated with microsecond precision"
      }
    },
    example: %{
      "id" => "f7e4b35b-5131-47c2-9a88-238bd6e62e2d",
      "tag_id" => "my-tag",
      "pattern" => "seller-a-*",
      "created_at" => "2024-09-25T19:17:54.871490",
      "updated_at" => "2024-09-25T19:19:01.648283"
    }
  })
end
