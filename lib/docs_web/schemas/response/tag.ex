defmodule DocsWeb.Schemas.Response.Tag do
  alias OpenApiSpex.Schema

  require OpenApiSpex

  OpenApiSpex.schema(%{
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
      created_at: %Schema{
        type: :string,
        format: "date-time",
        example: "2024-08-13T22:44:39.593704",
        description:
          "A NaiveDatetime-formatted timestamp describing when the resource was created with microsecond precision"
      },
      created_by: %Schema{
        type: :integer,
        format: :int64,
        description: "The user ID associated with the user who created the tag when applicable.",
        nullable: true
      },
      description: %Schema{
        type: :string,
        maxLength: 255,
        description: "An optional, brief description for this tag.",
        nullable: true
      },
      id: %Schema{
        type: :string,
        description: "The id of the tag in UUID format",
        format: :uuid
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
      },
      updated_at: %Schema{
        type: :string,
        format: "date-time",
        example: "2024-08-13T22:44:39.593704",
        description:
          "A NaiveDatetime-formatted timestamp describing when the resource was last updated with microsecond precision"
      },
      updated_by: %Schema{
        type: :integer,
        format: :int64,
        description: "The user ID associated with the last user to edit the tag when applicable.",
        nullable: true
      }
    }
  })
end
