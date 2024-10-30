defmodule DocsWeb.Schemas.Response.Tag do
  alias OpenApiSpex.Schema

  require OpenApiSpex

  OpenApiSpex.schema(%{
    title: "Tag",
    type: :object,
    properties: %{
      color: %Schema{
        type: "string",
        description: "The hexadecimal color code for the tag, without the leading `#`."
      },
      created_at: %Schema{
        type: "string",
        description:
          "A NaiveDatetime-formatted timestamp describing when the tag was created with microsecond precision."
      },
      created_by: %Schema{
        type: "integer",
        nullable: true
      },
      description: %Schema{
        type: "string",
        description: "An optional, brief description for the tag.",
        nullable: true
      },
      id: %Schema{
        type: "string"
      },
      is_active: %Schema{
        type: "boolean",
        description:
          "Indicates whether or not the tag is active. Inactive tags may not be associated to new resources."
      },
      name: %Schema{
        type: "string",
        description:
          "The name for the tag. It may contain lower case letters, dashes, and alphanumeric characters only. The maximum character count is 50."
      },
      updated_at: %Schema{
        type: "string"
      },
      updated_by: %Schema{
        type: "integer",
        nullable: true
      }
    },
    example: %{
      "color" => "008000",
      "created_at" => "2024-09-25T19:17:54.871490",
      "created_by" => nil,
      "description" => nil,
      "id" => "f7e4b35b-5131-47c2-9a88-238bd6e62e2d",
      "is_active" => false,
      "name" => "ny-warehouse",
      "updated_at" => "2024-09-25T19:19:01.648283",
      "updated_by" => nil
    }
  })
end
