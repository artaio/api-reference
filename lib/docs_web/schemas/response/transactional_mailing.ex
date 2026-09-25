defmodule DocsWeb.Schemas.Response.TransactionalMailing do
  alias OpenApiSpex.Schema

  require OpenApiSpex

  OpenApiSpex.schema(%{
    title: "TransactionalMailing",
    type: :object,
    description:
      "The delivery record of one notification email Arta sent on your Organization's behalf: " <>
        "who it was addressed to, how far it got, and which configuration produced it.",
    required: [
      :created_at,
      :email_rule_id,
      :email_subscription_id,
      :id,
      :recipients,
      :request_id,
      :sent_at,
      :shipment_id,
      :status,
      :type
    ],
    properties: %{
      created_at: %Schema{
        type: :string,
        description: "When Arta created the mailing, in UTC and without an offset.",
        example: "2026-09-20T15:23:11.000000",
        readOnly: true
      },
      email_rule_id: %Schema{
        type: :integer,
        description:
          "The Email Rule that produced this mailing, if one did. Retrieve it with " <>
            "`GET /email_rules/{email_rule_id}`, which answers `404` for a rule deleted since " <>
            "the mailing was sent.",
        example: 1942,
        nullable: true,
        readOnly: true
      },
      email_subscription_id: %Schema{
        type: :integer,
        description:
          "The Email Subscription that produced this mailing, if one did. Retrieve it with " <>
            "`GET /email_subscriptions/{email_subscription_id}`, which answers `404` for a " <>
            "subscription deleted since the mailing was sent.",
        example: 317,
        nullable: true,
        readOnly: true
      },
      id: %Schema{
        type: :string,
        format: :uuid,
        description: "The mailing's identifier.",
        example: "e25f02f6-44b1-47ab-8fb5-e5fcc6e3b754",
        readOnly: true
      },
      recipients: %Schema{
        type: :array,
        description: "Who the mailing was addressed to, in the order Arta addressed them.",
        items: %Schema{
          type: :object,
          required: [:email_address, :name],
          properties: %{
            email_address: %Schema{
              type: :string,
              description: "The address the mailing was sent to.",
              example: "gallery@example.com"
            },
            name: %Schema{
              type: :string,
              description: "The name Arta addressed, when one was known.",
              example: "Gallery",
              nullable: true
            }
          }
        },
        readOnly: true
      },
      request_id: %Schema{
        type: :string,
        format: :uuid,
        description: "The Request this mailing was sent about, if any.",
        example: "f5c8652b-7b23-4370-ac61-a474ccdad3db",
        nullable: true,
        readOnly: true
      },
      sent_at: %Schema{
        type: :string,
        description:
          "When the mailing was handed to the email provider, in UTC and without an offset. " <>
            "`null` until that happens, so a clause on this field returns only mailings already " <>
            "handed over.",
        example: "2026-09-20T15:23:11.000000",
        nullable: true,
        readOnly: true
      },
      shipment_id: %Schema{
        type: :string,
        format: :uuid,
        description: "The Shipment this mailing was sent about, if any.",
        example: "93604c50-8fd5-4953-adfe-922d3baf41ab",
        nullable: true,
        readOnly: true
      },
      status: %Schema{
        type: :string,
        description:
          "How far the mailing got. `sending`: a send is in flight to the email provider. " <>
            "`accepted`: the provider took the message and queued it. `delivered`: the recipient's " <>
            "mail server accepted it — only this value means the mailing reached them. `failed`: " <>
            "the provider could not deliver it. Outcomes are reported asynchronously, so `null` " <>
            "means none has been reported yet rather than that the mailing failed.",
        enum: ["accepted", "delivered", "failed", "sending"],
        example: "failed",
        nullable: true,
        readOnly: true
      },
      type: %Schema{
        type: :string,
        description:
          "The notification this mailing carried. The values are the `id` fields of " <>
            "`GET /metadata/email_notifications`.",
        example: "self_ship_label",
        readOnly: true
      }
    }
  })
end
