defmodule DocsWeb.Schemas.Response.Metadata.LocationAccessRestriction do
  alias OpenApiSpex.Schema

  require OpenApiSpex

  OpenApiSpex.schema(%{
    title: "MetadataLocationAccessRestriction",
    type: :array,
    deprecated: true,
    items: %Schema{
      type: :object,
      properties: %{
        description: %Schema{
          type: :string,
          description: "A long form description",
          example: "The location can only be accessed by elevator"
        },
        id: %Schema{
          type: :string,
          description: "The ID representing the resource",
          example: "elevator_only"
        },
        name: %Schema{
          type: :string,
          description: "A brief label for the resource",
          example: "Only Elevator"
        }
      }
    }
  })
end
