defmodule DocsWeb.Schemas.RequestBody.TagCreate do
  alias OpenApiSpex.Schema

  require OpenApiSpex

  OpenApiSpex.schema(%Schema{
    title: "TagCreate",
    type: :object,
    properties: %{
      tag: %Schema{
        type: :object,
        properties: %{
          color: %Schema{
            type: :string,
            description: "The hexadecimal color code for the tag, without the leading `#`.",
            example: "0000FF",
            minLength: 6,
            maxLength: 6,
            pattern: "^[0-9A-F]{6}$"
          },
          description: %Schema{
            type: :string,
            description: "An optional, brief description for this tag.",
            nullable: true,
            maxLength: 255
          },
          is_active: %Schema{
            type: :boolean,
            description:
              "Indicates whether or not the tag is active. Inactive tags may not be associated to new resources.",
            default: true
          },
          name: %Schema{
            type: :string,
            description:
              "The name for the tag. It may contain lower case letters, dashes, and alphanumeric characters only. The maximum character count is 50.",
            pattern: "^[a-z0-9-]{1,50}$",
            example: "la-warehouse",
            maxLength: 50
          }
        },
        required: ["color", "name"]
      }
    },
    required: ["tag"],
    additionalProperties: false
  })
end
