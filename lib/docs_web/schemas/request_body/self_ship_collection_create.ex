defmodule DocsWeb.Schemas.RequestBody.SelfShipCollectionCreate do
  alias DocsWeb.Schemas.RequestBody.{SelfShipCollectionCreateDhl, SelfShipCollectionCreateFedex}
  alias OpenApiSpex.Schema

  require OpenApiSpex

  OpenApiSpex.schema(%Schema{
    title: "SelfShipCollectionCreate",
    description: "The payload for scheduling a self-ship collection. The expected shape depends on `service.carrier`.",
    oneOf: [SelfShipCollectionCreateFedex, SelfShipCollectionCreateDhl]
  })
end
