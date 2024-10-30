defmodule DocsWeb.Schemas.RequestBody.TagUpdate do
  alias OpenApiSpex.Schema

  require OpenApiSpex

  OpenApiSpex.schema(%Schema{
    title: "TagUpdate",
    type: :object,
    properties: %{
      tag: %Schema{
        type: :object,
        properties: %{
          color: %Schema{
            type: :string,
            description: "The hexadecimal color code for the tag, without the leading `#`.",
            pattern: "^[0-9A-F]{6}$",
            maxLength: 6,
            minLength: 6,
            example: "0000FF"
          },
          description: %Schema{
            type: :string,
            maxLength: 255,
            description: "An optional, brief description for this tag.",
            nullable: true
          },
          is_active: %Schema{
            type: "boolean",
            description:
              "Indicates whether or not the tag is active. Inactive tags may not be associated to new resources"
          },
          name: %Schema{
            type: :string,
            description:
              "The name for the tag. It may contain lower case letters, dashes, and alphanumeric characters only. The maximum character count is 50.",
            pattern: "^[a-z0-9-]{1,50}$",
            maxLength: 50,
            example: "la-warehouse"
          }
        }
      }
    },
    required: ["tag"],
    additionalProperties: false
  })
end
