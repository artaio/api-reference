defmodule DocsWeb.ApiSpec do
  alias DocsWeb.Schemas.RequestBody.RequestUpdateCustom
  alias DocsWeb.Schemas.RequestBody.RequestUpdateContacts
  alias DocsWeb.Schemas.RequestBody.RequestCreate
  alias DocsWeb.Parameters.ArtaQuoteTimeout
  alias DocsWeb.Parameters.Search

  alias OpenApiSpex.{
    Info,
    OpenApi,
    Schema,
    Server,
    MediaType,
    Operation,
    PathItem,
    RequestBody
  }

  alias DocsWeb.Parameters
  alias DocsWeb.Schemas.{APIKey, Response}
  alias DocsWeb.Parameters.{Authorization, Page, PageSize}

  alias DocsWeb.Schemas.RequestBody.{
    AttachmentCreate,
    HostedSessionCreate,
    ApiKeyCreate,
    ShipmentCreate,
    OrganizationUpdate
  }

  @behaviour OpenApi

  @impl OpenApi
  def spec do
    %OpenApi{
      openapi: "3.1.0",
      servers: [
        %Server{
          url: "https://api.arta.io"
        }
      ],
      extensions: %{
        "x-topics" => [
          %{
            content:
              "The Arta API accepts server-to-server communications authenticated by API keys. Your API keys are self-managed and unique to your organization.\n\nUsing your API key to authenticate an API call is straightforward. Simply include your API Key token in the Authorization header of every call made to the system. This is the only place that it is accepted.",
            example:
              "```shell\n\n$ curl \\ \n\n -X GET https://api.arta.io/shipments \\ \n\n -H \"Authorization: ARTA_APIKey s0e1t2e3c4a5s6t7r8o9n10o11m12y\"",
            title: "Authentication"
          },
          %{
            content:
              "Arta imposes rate limits on API requests to maintain system stability and ensure fair usage. If you exceed these limits, the API will return a `429 Too Many Requests` error. Below are the rate limits for both Live and Test modes.\n\n**Live Mode:**\n\n*\tConcurrent requests: 15 API calls at the same time (any type)\n* Instant quote requests: 20 calls per minute\n* Overall requests: 1000 API calls per minute (any type)\n\n**Test Mode:**\n\n* Concurrent requests: 10 API calls at the same time (any type)\n* Instant quote requests: 10 calls per minute\n* Overall requests: 500 API calls per minute (any type)\n\nWhen a rate limit is exceeded, we recommend implementing retry logic with exponential backoff to handle 429 errors effectively.",
            title: "Rate Limits"
          },
          %{
            title: "Search",
            content:
              "The Arta API supports flexible search functionality across multiple resources, including Shipments, Requests, Hosted Sessions, Tags, and others. Using the search query parameter, you can construct structured queries to filter results based on specific criteria.\n\nKey features of the search functionality include:\n\n* Support for negation, wildcards, numeric filters, and date comparisons.\n* Each search query consists of one or more clauses, where each clause contains a `field`, an operator, and a `value`.\n* Clauses operating on the same field are combined using OR logic, while clauses across different fields are combined using AND logic.\n\n* Use quotation marks to keep multi-word search terms together.\n\nThis allows for powerful and precise filtering to retrieve the exact data you need from the API.\n\n**Syntax and operators**\n\nThe following table lists the operators and syntax that you can use to construct a search query clause.\n\n| Operator     | Usage                          | Description                                                                 | Examples                                                            |\n|------------|--------------------------------|-----------------------------------------------------------------------------|---------------------------------------------------------------------|\n| `:`        | `field:value`                  | Exact match operator (case insensitive)                                     | `status:pending` returns records where the status is `pending` |\n| `*`        | `value*`                       | Use an asterisk (wildcard operator) at the end of a term to match fields that start with the fragment                                    | `art*` returns records that match \"arta\" and \"artist\" but not \"smart\" |\n| `*`        | `*value`                       | Use an asterisk at the start of a term to match fields that end with the fragment                                    | `*art` returns \"smart\" but not \"martian\" |\n| `-`        | `-field:value`                 | Returns records that don’t match the clause                                 | `-status:pending` returns records that do not have a status of pending                 |\n| `>, <, =`  | `field:<value`, `field:>value`, `field:>=value`, `field:<=value` | Greater than/less than operators              | `created-at:<=2021-01-01` returns records from the beginning of time through January 1, 2021   |\n| `..`       | `field:value1..value2`                 | Filters for values within a given range where the first number is the lowest value and the second is the highest                                 | `created-at:2021-05-01..2021-05-15` returns records where the `created_at` field is between May 1, 2021 and May 15, 2021                 |\n\n\n\n**Hosted Session search fields**\n\n| Field | Type |\n|------------|--------------|\n| `created-at` | date |\n| `destination-address-line-1` | string |\n| `destination-city` | string |\n| `destination-contacts-emails` | string |\n| `destination-contacts-names` | string |\n| `destination-contacts-phone-numbers` | string |\n| `destination-country` | string |\n| `destination-postal-code` | string |\n| `destination-region` | string |\n| `insurance` | string |\n| `internal-reference` | string |\n| `object-creators` | string |\n| `object-descriptions` | string |\n| `object-internal-references` | string |\n| `object-public-references` | string |\n| `object-titles` | string |\n| `origin-address-line-1` | string |\n| `origin-city` | string |\n| `origin-contacts-emails` | string |\n| `origin-contacts-names` | string |\n| `origin-contacts-phone-numbers` | string |\n| `origin-country` | string |\n| `origin-postal-code` | string |\n| `origin-region` | string |\n| `public-reference` | string |\n| `quote-type` | string |\n| `shipping-notes` | string |\n| `shortcode` | string |\n| `status` | string |\n| `type` | string |\n| `tags` | string |\n\n**Request search fields**\n\n| Field | Type |\n|------------|--------------|\n| `bookable` | string |\n| `created-at` | date |\n| `destination-address-line-1` | string |\n| `destination-city` | string |\n| `destination-contacts-emails` | string |\n| `destination-contacts-names` | string |\n| `destination-contacts-phone-numbers` | string |\n| `destination-country` | string |\n| `destination-postal-code` | string |\n| `destination-region` | string |\n| `hosted-session` | string |\n| `internal-reference` | string |\n| `object-creators` | string |\n| `object-descriptions` | string |\n| `object-internal-references` | string |\n| `object-public-references` | string |\n| `object-titles` | string |\n| `origin-address-line-1` | string |\n| `origin-city` | string |\n| `origin-contacts-emails` | string |\n| `origin-contacts-names` | string |\n| `origin-contacts-phone-numbers` | string |\n| `origin-country` | string |\n| `origin-postal-code` | string |\n| `origin-region` | string |\n| `public-reference` | string |\n| `quote-type` | string |\n| `shipping-notes` | string |\n| `shortcode` | string |\n| `status` | string |\n| `tags` | string |\n\n**Shipment search fields**\n\n| Field | Type |\n|------------|--------------|\n| `created-at` | date |\n| `destination-address-line-1` | string |\n| `destination-city` | string |\n| `destination-contacts-emails` | string |\n| `destination-contacts-names` | string |\n| `destination-contacts-phone-numbers` | string |\n| `destination-country` | string |\n| `destination-postal-code` | string |\n| `destination-region` | string |\n| `eei-form-status` | string |\n| `hosted-session` | string |\n| `internal-reference` | string |\n| `object-creators` | string |\n| `object-descriptions` | string |\n| `object-internal-references` | string |\n| `object-public-references` | string |\n| `object-titles` | string |\n| `origin-address-line-1` | string |\n| `origin-city` | string |\n| `origin-contacts-emails` | string |\n| `origin-contacts-names` | string |\n| `origin-contacts-phone-numbers` | string |\n| `origin-country` | string |\n| `origin-postal-code` | string |\n| `origin-region` | string |\n| `public-reference` | string |\n| `quote-type` | string |\n| `request-shortcode` | string |\n| `shipping-notes` | string |\n| `shortcode` | string |\n| `status` | string |\n| `tags` | string |\n| `total` | numeric |\n| `total-currency` | string |\n| `tracking-numbers` | string |\n\n**Tag search fields**\n\n| Field | Type |\n|------------|--------------|\n| `color` | string |\n| `description` | string |\n| `is_active` | string |\n| `name` | string |\n\n"
          }
        ]
      },
      info: %Info{
        title: "Arta Public API",
        version: "2021-01-01",
        description:
          "The Arta Public API provides quote generation, transport booking, and tracking capabilities. Additionally the API enables Arta partner organizations to configure email and webhook notifications for their accounts.",
        contact: %{
          name: "Arta",
          email: "hello@arta.io",
          url: "https://manual.arta.io/"
        },
        termsOfService: "https://www.arta.io/legal/terms"
      },
      paths: %{
        "/api_keys" => %PathItem{
          get: %Operation{
            description:
              "Retrieve a paginated collection of API Keys belonging to your Organization",
            operationId: "apiKeys/list",
            summary: "List API Keys",
            tags: [
              "api_keys"
            ],
            parameters: [Authorization.parameter(), Page.parameter(), PageSize.parameter()],
            responses: %{
              200 =>
                Operation.response(
                  "A succesful collection of API Keys associated with your organization",
                  "application/json",
                  list(APIKey),
                  headers: default_headers()
                )
            }
          },
          post: %Operation{
            summary: "Create an API Key",
            description:
              "You can create mulitple API keys for your organization. All API keys operate on either Live or Test modes.",
            tags: [
              "api_keys"
            ],
            operationId: "apiKeys/create",
            parameters: [Authorization.parameter()],
            requestBody: %RequestBody{
              content: %{
                "application/json" => %MediaType{
                  schema: ApiKeyCreate
                }
              }
            },
            responses: %{
              201 =>
                Operation.response(
                  "The created API Key",
                  "application/json",
                  APIKey,
                  headers: default_headers()
                )
            }
          }
        },
        "/api_keys/{api_key_id}" => %PathItem{
          get: %Operation{
            summary: "Get an API Key",
            description: "Get an API Key",
            tags: [
              "api_keys"
            ],
            operationId: "apiKeys/get",
            parameters: [Authorization.parameter(), Parameters.APIKeyID.parameter()],
            responses: %{
              200 =>
                Operation.response(
                  "Successful API Key get response",
                  "application/json",
                  APIKey,
                  headers: default_headers()
                ),
              404 =>
                Operation.response(
                  "Object not found",
                  "application/json",
                  nil
                )
            }
          },
          delete: %Operation{
            summary: "Delete an API Key",
            description: "Delete an API Key belonging to your Organization",
            tags: [
              "api_keys"
            ],
            operationId: "apiKeys/delete",
            parameters: [Authorization.parameter(), Parameters.APIKeyID.parameter()],
            responses: %{
              204 =>
                Operation.response(
                  "API Key deleted",
                  "application/json",
                  nil,
                  headers: default_headers()
                ),
              404 =>
                Operation.response(
                  "Object not found",
                  "application/json",
                  nil
                )
            }
          }
        },
        "/attachments" => %PathItem{
          get: %Operation{
            summary: "List Attachments",
            description:
              "Retrieve a paginated collection of Attachment records belonging to your Organization",
            tags: [
              "attachments"
            ],
            operationId: "attachments/list",
            parameters: [Authorization.parameter(), Page.parameter(), PageSize.parameter()],
            responses: %{
              200 =>
                Operation.response(
                  "A collection of Attachment records",
                  "application/json",
                  list(Response.Attachment),
                  headers: default_headers()
                )
            }
          },
          post: %Operation{
            summary: "Create an Attachment",
            description:
              "The attachment resource connects uploads on Arta to shipment or request resources. Attached uploads are visible in the Arta Dashobard under the \"Documents\" tab on the shipment and request detail pages.\n\nEach upload may be attached to many requests or shipments. Each request or shipment may have many associated uploads.\n\nTo create an attachment via the API you can must send an authenticated request to the `POST /attachments` endpoint with a body that includes one of two different payload schema.\n\nTo attach an upload to a shipment, the attachment payload must include `upload_id` and `shipment_id` attributes. This payload must not include a `request_id` attribute. For example:\n\n```json\n{\n    \"attachment\": {\n        \"shipment_id\": \"506d79b6-1e5e-4e8c-a266-74658fdaf4ee\",\n        \"upload_id\": 5285\n    }\n}\n```\n\nTo attach an upload to a request, the attachment payload must include `upload_id` and `request_id` attributes. This payload must not include a `shipment_id` attribute. For example:\n\n```json\n{\n    \"attachment\": {\n        \"request_id\": \"506d79b6-1e5e-4e8c-a266-74658fdaf4ee\",\n        \"upload_id\": 5285\n    }\n}\n```",
            tags: [
              "attachments"
            ],
            operationId: "attachments/create",
            parameters: [Authorization.parameter()],
            requestBody: %RequestBody{
              content: %{
                "application/json" => %MediaType{
                  schema: AttachmentCreate
                }
              }
            },
            responses: %{
              200 =>
                Operation.response(
                  "The created attachment",
                  "application/json",
                  Response.Attachment,
                  headers: default_headers()
                ),
              400 => Response.BadRequest.build()
            }
          }
        },
        "/attachments/{attachment_id}" => %PathItem{
          get: %Operation{
            summary: "Retrieve an Attachment",
            description: "Retrieve an existing Attachment",
            tags: [
              "attachments"
            ],
            operationId: "attachments/get",
            parameters: [Authorization.parameter(), Parameters.AttachmentID.parameter()],
            responses: %{
              200 =>
                Operation.response(
                  "Successful Attachment get response",
                  "application/json",
                  Response.Attachment,
                  headers: default_headers()
                ),
              404 =>
                Operation.response(
                  "Object not found",
                  "application/json",
                  nil
                )
            }
          },
          delete: %Operation{
            summary: "Delete an Attachment",
            description: "Delete an existing Attachment",
            tags: [
              "attachments"
            ],
            operationId: "attachments/delete",
            parameters: [Authorization.parameter(), Parameters.AttachmentID.parameter()],
            responses: %{
              204 =>
                Operation.response(
                  "Attachment deleted",
                  "application/json",
                  nil,
                  headers: default_headers()
                ),
              404 =>
                Operation.response(
                  "Object not found",
                  "application/json",
                  nil
                )
            }
          }
        },
        "/email_rules" => %PathItem{
          get: %Operation{
            summary: "List Email Rules",
            description:
              "Retrieve a paginated collection of Email Rules belonging to your Organization",
            tags: ["email_rules"],
            operationId: "emailRules/list",
            parameters: [Authorization.parameter(), Page.parameter(), PageSize.parameter()],
            responses: %{
              200 =>
                Operation.response(
                  "A collection of Email Rules",
                  "application/json",
                  list(Response.EmailRule),
                  headers: default_headers()
                )
            }
          },
          post: %Operation{
            summary: "Create an Email Rule",
            description:
              "Create an email rule to configure email notifications for your organization.",
            tags: ["email_rules"],
            operationId: "emailRules/create",
            parameters: [Authorization.parameter()],
            requestBody: %RequestBody{
              content: %{
                "application/json" => %MediaType{
                  schema: DocsWeb.Schemas.RequestBody.EmailRuleCreate
                }
              }
            },
            responses: %{
              201 =>
                Operation.response(
                  "The created email rule",
                  "application/json",
                  Response.EmailRule,
                  headers: default_headers()
                ),
              400 => Response.BadRequest.build()
            }
          }
        },
        "/email_rules/{email_rule_id}" => %PathItem{
          get: %Operation{
            summary: "Get an Email Rule",
            description: "Retrieve an existing Email Rule request",
            tags: ["email_rules"],
            operationId: "emailRules/get",
            parameters: [Authorization.parameter(), Parameters.EmailRuleID.parameter()],
            responses: %{
              200 =>
                Operation.response(
                  "Successful Email Rule get response",
                  "application/json",
                  Response.EmailRule,
                  headers: default_headers()
                ),
              404 =>
                Operation.response(
                  "Object not found",
                  "application/json",
                  nil
                )
            }
          },
          delete: %Operation{
            summary: "Delete an Email Rule",
            description: "Delete an Email Rule",
            tags: ["email_rules"],
            operationId: "emailRules/delete",
            parameters: [Authorization.parameter(), Parameters.EmailRuleID.parameter()],
            responses: %{
              204 =>
                Operation.response(
                  "Email Rule deleted",
                  "application/json",
                  nil,
                  headers: default_headers()
                ),
              404 =>
                Operation.response(
                  "Object not found",
                  "application/json",
                  nil
                )
            }
          },
          patch: %Operation{
            summary: "Update an Email Rule",
            description: "Update an Email Rule request",
            tags: ["email_rules"],
            operationId: "emailRules/update",
            parameters: [Authorization.parameter(), Parameters.EmailRuleID.parameter()],
            requestBody: %RequestBody{
              content: %{
                "application/json" => %MediaType{
                  schema: DocsWeb.Schemas.RequestBody.EmailRuleUpdate
                }
              }
            },
            responses: %{
              200 =>
                Operation.response(
                  "The updated email rule",
                  "application/json",
                  Response.EmailRule,
                  headers: default_headers()
                ),
              404 =>
                Operation.response(
                  "Object not found",
                  "application/json",
                  nil
                )
            }
          }
        },
        "/email_subscriptions" => %PathItem{
          get: %Operation{
            description:
              "Retrieve a paginated collection of Email Subscriptions belonging to your Organization",
            operationId: "emailSubscriptions/list",
            summary: "List Email Subscriptions",
            tags: [
              "email_subscriptions"
            ],
            parameters: [Authorization.parameter(), Page.parameter(), PageSize.parameter()],
            responses: %{
              200 =>
                Operation.response(
                  "A collection of Email Subscriptions",
                  "application/json",
                  list(Response.EmailSubscription),
                  headers: default_headers()
                )
            }
          },
          post: %Operation{
            summary: "Create an Email Subscription",
            description:
              "Create an email subscription to configure email notifications for your organization.",
            tags: [
              "email_subscriptions"
            ],
            operationId: "emailSubscriptions/create",
            parameters: [Authorization.parameter()],
            requestBody: %RequestBody{
              content: %{
                "application/json" => %MediaType{
                  schema: DocsWeb.Schemas.RequestBody.EmailSubscriptionCreate
                }
              }
            },
            responses: %{
              201 =>
                Operation.response(
                  "The created email subscription",
                  "application/json",
                  Response.EmailSubscription,
                  headers: default_headers()
                ),
              400 => Response.BadRequest.build()
            }
          }
        },
        "/email_subscriptions/{email_subscription_id}" => %PathItem{
          get: %Operation{
            summary: "Get an Email Subscription",
            description: "Retrieve an existing Email Subscription request",
            tags: ["email_subscriptions"],
            operationId: "emailSubscriptions/get",
            parameters: [Authorization.parameter(), Parameters.EmailSubscriptionID.parameter()],
            responses: %{
              200 =>
                Operation.response(
                  "Successful Email Subscription response",
                  "application/json",
                  Response.EmailSubscription,
                  headers: default_headers()
                ),
              404 =>
                Operation.response(
                  "Object not found",
                  "application/json",
                  nil
                )
            }
          },
          delete: %Operation{
            summary: "Delete an Email Subscription",
            description: "Delete an Email Subscription",
            tags: ["email_subscriptions"],
            operationId: "emailSubscriptions/delete",
            parameters: [Authorization.parameter(), Parameters.EmailSubscriptionID.parameter()],
            responses: %{
              204 =>
                Operation.response(
                  "Email Subscription deleted",
                  "application/json",
                  nil,
                  headers: default_headers()
                ),
              404 =>
                Operation.response(
                  "Object not found",
                  "application/json",
                  nil
                )
            }
          },
          patch: %Operation{
            summary: "Update an Email Subscription",
            description: "Update an existing Email Subscription request",
            tags: ["email_subscriptions"],
            operationId: "emailSubscriptions/update",
            parameters: [Authorization.parameter(), Parameters.EmailSubscriptionID.parameter()],
            requestBody: %RequestBody{
              content: %{
                "application/json" => %MediaType{
                  schema: DocsWeb.Schemas.RequestBody.EmailSubscriptionUpdate
                }
              }
            },
            responses: %{
              200 =>
                Operation.response(
                  "The updated email subscription",
                  "application/json",
                  Response.EmailSubscription,
                  headers: default_headers()
                ),
              404 =>
                Operation.response(
                  "Object not found",
                  "application/json",
                  nil
                )
            }
          }
        },
        "/hosted_sessions" => %PathItem{
          get: %Operation{
            description:
              "Retrieve a paginated collection of hosted sessions belonging to your organization",
            operationId: "hostedSessions/list",
            summary: "List Hosted Sessions",
            tags: [
              "hosted_sessions"
            ],
            parameters: [Authorization.parameter(), Page.parameter(), PageSize.parameter()],
            responses: %{
              200 =>
                Operation.response(
                  "A paginated collection of hosted sessions",
                  "application/json",
                  list(Response.HostedSession),
                  headers: default_headers()
                )
            }
          },
          post: %Operation{
            summary: "Create a Hosted Session",
            description:
              "Create a hosted session resource to generate an Arta Booking url.\n\nThis endpoint expects one of two versions of the `hosted_session` schema:\n\n* You may send a `hosted_session` object with a subset of the fields required for generating quote requests via the Arta API. With this schema, you must minimally include valid `objects` and `origin` details in your API call. Additionally, you may provide a `success_url` and a `cancel_url` to determine where Arta will redirect the user after the session is complete\n\n* Alternatively, you may share an existing Quote Request by sending a `hosted_session` object with the corresponding request's `request_id`. This will create an Arta Booking session for the request\n\nUse the private `url` in the successful hosted session response to direct your users to the Arta Booking web page so that they may configure and book their own shipment.",
            tags: [
              "hosted_sessions"
            ],
            operationId: "hostedSessions/create",
            parameters: [Authorization.parameter()],
            requestBody: %RequestBody{
              content: %{
                "application/json" => %MediaType{
                  schema: HostedSessionCreate
                }
              }
            },
            responses: %{
              200 =>
                Operation.response(
                  "the created hosted sessions",
                  "application/json",
                  Response.HostedSession,
                  headers: default_headers()
                )
            }
          }
        },
        "/hosted_sessions/{hosted_session_id}" => %PathItem{
          get: %Operation{
            summary: "Get a Hosted Session",
            description: "Retrieve an existing hosted session resource",
            tags: ["hosted_sessions"],
            operationId: "hostedSessions/get",
            parameters: [Authorization.parameter(), Parameters.HostedSessionID.parameter()],
            responses: %{
              200 =>
                Operation.response(
                  "Successful Hosted Session response",
                  "application/json",
                  Response.HostedSession,
                  headers: default_headers()
                ),
              404 =>
                Operation.response(
                  "Object not found",
                  "application/json",
                  nil
                )
            }
          }
        },
        "/hosted_sessions/{hosted_session_id}/cancel" => %PathItem{
          patch: %Operation{
            summary: "Cancel a Hosted Session",
            description: "Cancel an existing hosted session resource",
            tags: ["hosted_sessions"],
            operationId: "hostedSessions/cancel",
            parameters: [Authorization.parameter(), Parameters.HostedSessionID.parameter()],
            responses: %{
              200 =>
                Operation.response(
                  "Successfully cancelled Hosted Session response",
                  "application/json",
                  Response.HostedSession,
                  headers: default_headers()
                ),
              404 =>
                Operation.response(
                  "Object not found",
                  "application/json",
                  nil
                )
            }
          }
        },
        "/invoice_payments" => %PathItem{
          get: %Operation{
            summary: "List Invoice Payment records",
            description:
              "Retrieve a paginated collection of Invoice Payments belonging to your Organization",
            tags: [
              "invoice_payments"
            ],
            operationId: "invoicePayments/list",
            parameters: [Authorization.parameter(), Page.parameter(), PageSize.parameter()],
            responses: %{
              200 =>
                Operation.response(
                  "A collection of Invoice Payment records",
                  "application/json",
                  list(Response.InvoicePayment),
                  headers: default_headers()
                )
            }
          }
        },
        "/invoice_payments/{invoice_payment_id}" => %PathItem{
          get: %Operation{
            summary: "Get an Invoice Payment record",
            description: "Retrieve an existing Invoice Payment record",
            tags: ["invoice_payments"],
            operationId: "invoicePayments/get",
            parameters: [Authorization.parameter(), Parameters.InvoicePaymentID.parameter()],
            responses: %{
              200 =>
                Operation.response(
                  "Successful Invoice Payment response",
                  "application/json",
                  Response.InvoicePayment,
                  headers: default_headers()
                ),
              404 =>
                Operation.response(
                  "Object not found",
                  "application/json",
                  nil
                )
            }
          }
        },
        "/invoices" => %PathItem{
          get: %Operation{
            summary: "List Invoice records",
            description:
              "Retrieve a paginated collection of Invoices belonging to your Organization",
            tags: [
              "invoices"
            ],
            operationId: "invoices/list",
            parameters: [Authorization.parameter(), Page.parameter(), PageSize.parameter()],
            responses: %{
              200 =>
                Operation.response(
                  "A collection of Invoice records",
                  "application/json",
                  list(Response.Invoice),
                  headers: default_headers()
                )
            }
          }
        },
        "/invoices/{invoice_id}" => %PathItem{
          get: %Operation{
            summary: "Get an Invoice record",
            description: "Retrieve an existing Invoice record",
            tags: ["invoices"],
            operationId: "invoices/get",
            parameters: [Authorization.parameter(), Parameters.InvoiceID.parameter()],
            responses: %{
              200 =>
                Operation.response(
                  "Successful Invoice response",
                  "application/json",
                  Response.Invoice,
                  headers: default_headers()
                ),
              404 =>
                Operation.response(
                  "Object not found",
                  "application/json",
                  nil
                )
            }
          }
        },
        "/logs" => %PathItem{
          get: %Operation{
            summary: "List Log records",
            description:
              "Retrieve a paginated collection of Log records belonging to your Organization",
            tags: [
              "logs"
            ],
            operationId: "logs/list",
            parameters: [Authorization.parameter(), Page.parameter(), PageSize.parameter()],
            responses: %{
              200 =>
                Operation.response(
                  "A collection of Log records",
                  "application/json",
                  list(Response.Log),
                  headers: default_headers()
                )
            }
          }
        },
        "/logs/{log_id}" => %PathItem{
          get: %Operation{
            summary: "Get a Log record",
            description: "Retrieve an existing Log record",
            tags: ["logs"],
            operationId: "logs/get",
            parameters: [Authorization.parameter(), Parameters.LogID.parameter()],
            responses: %{
              200 =>
                Operation.response(
                  "Successful Log response",
                  "application/json",
                  Response.Log,
                  headers: default_headers()
                ),
              404 =>
                Operation.response(
                  "Object not found",
                  "application/json",
                  nil
                )
            }
          }
        },
        "/metadata/api_versions" => %PathItem{
          get: %Operation{
            summary: "API Versions",
            description: "The list of API versions supported by Arta's API.",
            tags: [
              "metadata"
            ],
            operationId: "metadata/apiVersions",
            parameters: [Authorization.parameter()],
            responses: %{
              200 =>
                Operation.response(
                  "A collection of API versions",
                  "application/json",
                  Response.Metadata.ApiVersion
                )
            }
          }
        },
        "/metadata/currencies" => %PathItem{
          get: %Operation{
            summary: "Currencies",
            description: "The list of currencies supported by Arta's API.",
            tags: [
              "metadata"
            ],
            operationId: "metadata/currencies",
            parameters: [Authorization.parameter()],
            responses: %{
              200 =>
                Operation.response(
                  "A collection of currency types",
                  "application/json",
                  Response.Metadata.Currency
                )
            }
          }
        },
        "/metadata/commercial_carriers" => %PathItem{
          get: %Operation{
            summary: "Commercial Carriers",
            description: "The list of commercial carriers supported by Arta's API.",
            tags: [
              "metadata"
            ],
            operationId: "metadata/commercialCarriers",
            parameters: [Authorization.parameter()],
            responses: %{
              200 =>
                Operation.response(
                  "A collection of commercial carriers",
                  "application/json",
                  Response.Metadata.CommercialCarrier
                )
            }
          }
        },
        "/metadata/email_notifications" => %PathItem{
          get: %Operation{
            summary: "Email Notifications",
            description: "The list of email notification types supported by Arta's API.",
            tags: [
              "metadata"
            ],
            operationId: "metadata/emailNotifications",
            parameters: [Authorization.parameter()],
            responses: %{
              200 =>
                Operation.response(
                  "A collection of email notification types",
                  "application/json",
                  Response.Metadata.EmailNotification
                )
            }
          }
        },
        "/metadata/insurances" => %PathItem{
          get: %Operation{
            summary: "Insurances",
            description: "The list of insurance types supported by Arta's API.",
            tags: [
              "metadata"
            ],
            operationId: "metadata/insurances",
            parameters: [Authorization.parameter()],
            responses: %{
              200 =>
                Operation.response(
                  "A collection of insurance types",
                  "application/json",
                  Response.Metadata.Insurance
                )
            }
          }
        },
        "/metadata/location_access_restrictions" => %PathItem{
          get: %Operation{
            summary: "Location Access Restrictions",
            description: "The list of location access restriction types supported by Arta's API.",
            tags: [
              "metadata"
            ],
            operationId: "metadata/locationAccessRestrictions",
            parameters: [Authorization.parameter()],
            responses: %{
              200 =>
                Operation.response(
                  "A collection of location access restriction types",
                  "application/json",
                  Response.Metadata.LocationAccessRestriction
                )
            }
          }
        },
        "/metadata/object_materials" => %PathItem{
          get: %Operation{
            summary: "Object Materials",
            description: "The list of object material types supported by Arta's API.",
            tags: [
              "metadata"
            ],
            operationId: "metadata/objectMaterials",
            parameters: [Authorization.parameter()],
            responses: %{
              200 =>
                Operation.response(
                  "A collection of object material types",
                  "application/json",
                  Response.Metadata.ObjectMaterial
                )
            }
          }
        },
        "/metadata/objects" => %PathItem{
          get: %Operation{
            summary: "Objects",
            description: "The list of object types supported by Arta's API.",
            tags: [
              "metadata"
            ],
            operationId: "metadata/objects",
            parameters: [Authorization.parameter()],
            responses: %{
              200 =>
                Operation.response(
                  "A collection of object types",
                  "application/json",
                  Response.Metadata.Object
                )
            }
          }
        },
        "/metadata/package_statuses" => %PathItem{
          get: %Operation{
            summary: "Package Statuses",
            description: "The list of package status types supported by Arta's API.",
            tags: [
              "metadata"
            ],
            operationId: "metadata/packageStatuses",
            parameters: [Authorization.parameter()],
            responses: %{
              200 =>
                Operation.response(
                  "A collection of package status types",
                  "application/json",
                  Response.Metadata.PackageStatus
                )
            }
          }
        },
        "/metadata/packings" => %PathItem{
          get: %Operation{
            summary: "Packings",
            description: "The list of packing types supported by Arta's API.",
            tags: [
              "metadata"
            ],
            operationId: "metadata/packings",
            parameters: [Authorization.parameter()],
            responses: %{
              200 =>
                Operation.response(
                  "A collection of packing types",
                  "application/json",
                  Response.Metadata.Packing
                )
            }
          }
        },
        "/metadata/parcel_transport_services" => %PathItem{
          get: %Operation{
            summary: "Parcel Transport Services",
            description: "The list of parcel transport service types supported by Arta's API.",
            tags: [
              "metadata"
            ],
            operationId: "metadata/parcelTransportServices",
            parameters: [Authorization.parameter()],
            responses: %{
              200 =>
                Operation.response(
                  "A collection of parcel transport service types",
                  "application/json",
                  Response.Metadata.ParcelTransportService
                )
            }
          }
        },
        "/metadata/payment_process_types" => %PathItem{
          get: %Operation{
            summary: "Payment Process Types",
            description: "The list of payment process types supported by Arta's API.",
            tags: [
              "metadata"
            ],
            operationId: "metadata/paymentProcessTypes",
            parameters: [Authorization.parameter()],
            responses: %{
              200 =>
                Operation.response(
                  "A collection of shipment Payment Process types",
                  "application/json",
                  Response.Metadata.PaymentProcessType
                )
            }
          }
        },
        "/metadata/quotes" => %PathItem{
          get: %Operation{
            summary: "Quote Types",
            description: "The list of Quote types provided by Arta.",
            tags: [
              "metadata"
            ],
            operationId: "metadata/quotes",
            parameters: [Authorization.parameter()],
            responses: %{
              200 =>
                Operation.response(
                  "A collection of quote types",
                  "application/json",
                  Response.Metadata.Quote
                )
            }
          }
        },
        "/metadata/request_statuses" => %PathItem{
          get: %Operation{
            summary: "Quote Request Statuses",
            description: "The list of statuses for a quote request resources.",
            tags: [
              "metadata"
            ],
            operationId: "metadata/requestStatuses",
            parameters: [Authorization.parameter()],
            responses: %{
              200 =>
                Operation.response(
                  "A collection of quote request statuses",
                  "application/json",
                  Response.Metadata.RequestStatus
                )
            }
          }
        },
        "/metadata/services" => %PathItem{
          get: %Operation{
            summary: "Services",
            description: "The list of shipment services supported by Arta's API.",
            tags: [
              "metadata"
            ],
            operationId: "metadata/services",
            parameters: [Authorization.parameter()],
            responses: %{
              200 =>
                Operation.response(
                  "A collection of service types",
                  "application/json",
                  Response.Metadata.Service
                )
            }
          }
        },
        "/metadata/shipment_exception_types" => %PathItem{
          get: %Operation{
            summary: "Shipment Exception Types",
            description: "Retrieve the list of shipment exception types",
            tags: [
              "metadata"
            ],
            operationId: "metadata/shipmentExceptionTypes",
            parameters: [Authorization.parameter()],
            responses: %{
              200 =>
                Operation.response(
                  "A collection of shipment exception types",
                  "application/json",
                  Response.Metadata.ShipmentExceptionType
                )
            }
          }
        },
        "/metadata/shipment_statuses" => %PathItem{
          get: %Operation{
            summary: "Shipment Statuses",
            description: "The list of statuses for a shipment on Arta.",
            tags: [
              "metadata"
            ],
            operationId: "metadata/shipmentStatuses",
            parameters: [Authorization.parameter()],
            responses: %{
              200 =>
                Operation.response(
                  "A collection of shipment statuses",
                  "application/json",
                  Response.Metadata.ShipmentStatus
                )
            }
          }
        },
        "/organization" => %PathItem{
          get: %Operation{
            summary: "Get an Organization",
            description:
              "Retrieve the Organization associated with the API Key in the Authorization header",
            tags: ["organization"],
            operationId: "organization-get",
            parameters: [Authorization.parameter()],
            responses: %{
              200 =>
                Operation.response(
                  "Successful Organization response",
                  "application/json",
                  Response.Organization,
                  headers: default_headers()
                ),
              404 =>
                Operation.response(
                  "Object not found",
                  "application/json",
                  nil
                )
            }
          },
          patch: %Operation{
            summary: "Update an Organization",
            description:
              "Update the Organization associated with the API Key in the Authorization header",
            tags: ["organization"],
            operationId: "organization-patch",
            parameters: [Authorization.parameter()],
            requestBody: %RequestBody{
              content: %{
                "application/json" => %MediaType{
                  schema: OrganizationUpdate
                }
              }
            },
            responses: %{
              200 =>
                Operation.response(
                  "Successful Organization update response",
                  "application/json",
                  Response.Organization,
                  headers: default_headers()
                ),
              404 =>
                Operation.response(
                  "Object not found",
                  "application/json",
                  nil
                )
            }
          }
        },
        "/payments" => %PathItem{
          get: %Operation{
            summary: "List Payment records",
            description:
              "Retrieve a paginated collection of Payments belonging to your Organization",
            tags: [
              "payments"
            ],
            operationId: "payments/list",
            parameters: [Authorization.parameter(), Page.parameter(), PageSize.parameter()],
            responses: %{
              200 =>
                Operation.response(
                  "A collection of Payment records",
                  "application/json",
                  list(Response.Payment),
                  headers: default_headers()
                )
            }
          }
        },
        "/payments/{payment_id}" => %PathItem{
          get: %Operation{
            summary: "Get a Payment record",
            description: "Retrieve an existing Payment record",
            tags: ["payments"],
            operationId: "payments/get",
            parameters: [Authorization.parameter(), Parameters.PaymentID.parameter()],
            responses: %{
              200 =>
                Operation.response(
                  "Successful Payment response",
                  "application/json",
                  Response.Payment,
                  headers: default_headers()
                ),
              404 =>
                Operation.response(
                  "Object not found",
                  "application/json",
                  nil
                )
            }
          }
        },
        "/requests" => %PathItem{
          get: %Operation{
            summary: "List Request records",
            description:
              "Retrieve a paginated collection of Quote request records belonging to your Organization",
            tags: ["requests"],
            operationId: "requests/list",
            parameters: [
              Authorization.parameter(),
              Page.parameter(),
              PageSize.parameter(),
              Search.parameter()
            ],
            responses: %{
              200 =>
                Operation.response(
                  "A collection of Quote Request records",
                  "application/json",
                  list(Response.RequestListItem),
                  headers: default_headers()
                )
            }
          },
          post: %Operation{
            summary: "Create a Quote Request",
            description:
              "The first step to booking a shipment on Arta is to create a quote request. This quote request provides Arta with all the necessary transport details for us to price your eventual shipment. \n\n Arta will return eligible quotes for your shipment across Arta's Premium, Selecct, and Parcel quote types. If any quote types are ineligible given your logistic details, those will be noted in the `disqualifications` response. \n\n You must minimally include `objects`, `origin`, and `destination` details in your API call for Arta to successfully price the transport.",
            tags: ["requests"],
            operationId: "requests/create",
            parameters: [Authorization.parameter(), ArtaQuoteTimeout.parameter()],
            requestBody: %RequestBody{
              content: %{
                "application/json" => %MediaType{
                  schema: RequestCreate
                }
              }
            },
            responses: %{
              201 =>
                Operation.response(
                  "response",
                  "application/json",
                  Response.Request,
                  headers: default_headers()
                ),
              400 =>
                Operation.response(
                  "Bad Request",
                  "application/json",
                  nil
                )
            }
          }
        },
        "/requests/{request_id}" => %PathItem{
          get: %Operation{
            summary: "Get a Quote Request",
            description: "Retrieve an existing Shipment Quote Request record by its ID",
            tags: ["requests"],
            operationId: "requests/get",
            parameters: [Authorization.parameter(), Parameters.RequestID.parameter()],
            responses: %{
              200 =>
                Operation.response(
                  "Successful Request get response",
                  "application/json",
                  Response.Request,
                  headers: default_headers()
                ),
              404 =>
                Operation.response(
                  "Object not found",
                  "application/json",
                  nil
                )
            }
          }
        },
        "/requests/{request_id}/contacts" => %PathItem{
          patch: %Operation{
            summary: "Update the contacts for a Quote Request",
            description:
              "For quote requests with a current status of `quoted` or `disqualified`, you may update the contacts associated with either or both of the origin and destination locations.\n\nCompleting the missing contact details for a previously unbookable quote request may change the bookable status for the request if all other requirements are met.\n\nThis endpoint payload requires at least one of a destination or an origin object to be present.",
            tags: ["requests"],
            operationId: "requests/update/contacts",
            parameters: [Authorization.parameter(), Parameters.RequestID.parameter()],
            requestBody: %RequestBody{
              content: %{
                "application/json" => %MediaType{
                  schema: RequestUpdateContacts
                }
              }
            },
            responses: %{
              200 =>
                Operation.response(
                  "Successful Request get response",
                  "application/json",
                  Response.Request,
                  headers: default_headers()
                ),
              404 =>
                Operation.response(
                  "Object not found",
                  "application/json",
                  nil
                )
            }
          }
        },
        "/requests/{request_id}/custom" => %PathItem{
          patch: %Operation{
            summary: "Request custom quotes",
            description: "Convert an existing Quote Request into a Custom Quote Request.",
            tags: ["requests"],
            operationId: "requests/custom",
            parameters: [Authorization.parameter(), Parameters.RequestID.parameter()],
            requestBody: %RequestBody{
              content: %{
                "application/json" => %MediaType{
                  schema: RequestUpdateCustom
                }
              }
            },
            responses: %{
              200 =>
                Operation.response(
                  "Successful Request get response",
                  "application/json",
                  Response.Request,
                  headers: default_headers()
                ),
              404 =>
                Operation.response(
                  "Object not found",
                  "application/json",
                  nil
                )
            }
          }
        },
        "/requests/{request_id}/cancel" => %PathItem{
          patch: %Operation{
            summary: "Cancel a Quote Request",
            description:
              "Cancels an in_progress Quote Request resource. This is useful to indicate to Arta that you no longer require custom quotes for a request.",
            tags: ["requests"],
            operationId: "requests/cancel",
            parameters: [Authorization.parameter(), Parameters.RequestID.parameter()],
            responses: %{
              200 =>
                Operation.response(
                  "Successful Request get response",
                  "application/json",
                  Response.Request,
                  headers: default_headers()
                ),
              404 =>
                Operation.response(
                  "Object not found",
                  "application/json",
                  nil
                )
            }
          }
        },
        "/shipments" => %PathItem{
          get: %Operation{
            summary: "List Shipment records",
            description:
              "Retrieve a paginated collection of Shipment records belonging to your Organization",
            tags: [
              "shipments"
            ],
            operationId: "shipments/list",
            parameters: [Authorization.parameter()],
            responses: %{
              200 =>
                Operation.response(
                  "A collection of Shipment records",
                  "application/json",
                  list(Response.ShipmentList)
                )
            }
          },
          post: %Operation{
            summary: "Create a Shipment",
            description:
              "This endpoint is used for two purposes:\n\n**1. Generating standard Arta shipments**\n\nAll [standard shipments](https://manual.arta.io/guides/logistics/workflow) are actively facilitated by Arta. Working in tandem with our extensive logistics carrier network, Arta fulfills shipments with `Premium`, `Select`, and `Parcel` quote types from scheduling collection, to coordinating packing, through delivery. For shipments with the `Self Ship` quote type, Arta will generate labels on your behalf with commercial carriers such as FedEx, UPS, and DHL.\n\nTo book a standard Arta shipment, you must first create a shipping quote request. You can then use a `quote_id` returned by the quote request endpoint to create the shipment.\n\n**2. Generating Track shipments**\n\n[Track shipments](https://manual.arta.io/guides/solutions/no-code/post-sale/tracking/track) provide a similar customer tracking and notification experience as standard Arta shipments but for shipments you have booked with commercial carriers outside of the Arta platform.\n\nTo create a Track shipment, you provide the `carrier` and `tracking_number` purchased externally and the Arta platform provides status automation, tracking pages, and customer notifications. You may optionally provide additional supplementary information such as origin, destination, and package details for Track shipments.\n\n_Note that Track shipments are a beta feature. Please contact your account manager or hello@arta.io to request access for your organization._",
            tags: [
              "shipments"
            ],
            operationId: "shipments/create",
            parameters: [Authorization.parameter()],
            requestBody: %RequestBody{
              content: %{
                "application/json" => %MediaType{
                  schema: ShipmentCreate
                }
              }
            },
            responses: %{
              200 =>
                Operation.response(
                  "The created shipment",
                  "application/json",
                  Response.Shipment,
                  headers: default_headers()
                ),
              403 =>
                Operation.response(
                  "Forbidden",
                  "application/json",
                  nil
                ),
              404 =>
                Operation.response(
                  "Object not found",
                  "application/json",
                  nil
                ),
              422 =>
                Operation.response(
                  "Unprocessible entity",
                  "application/json",
                  Response.Error
                )
            }
          }
        },
        "/shipments/{shipment_id}" => %PathItem{
          get: %Operation{
            summary: "Retrieve a Shipment record",
            description: "Retrieve an existing Shipment record",
            tags: [
              "shipments"
            ],
            operationId: "shipments/get",
            parameters: [Authorization.parameter(), Parameters.ShipmentID.parameter()],
            responses: %{
              200 =>
                Operation.response(
                  "Successful Shipment get response",
                  "application/json",
                  Response.Shipment,
                  headers: default_headers()
                ),
              404 =>
                Operation.response(
                  "Object not found",
                  "application/json",
                  nil
                )
            }
          }
        }
      }
    }
    # Discover request/response schemas from path specs
    |> OpenApiSpex.resolve_schema_modules()
  end

  defp list(type) do
    %Schema{
      type: "object",
      properties: %{
        items: %Schema{
          type: "array",
          items: type
        },
        metadata: %Schema{
          type: "object",
          properties: %{
            page: %Schema{
              type: "integer",
              format: "int64",
              example: 1,
              readOnly: true
            },
            page_size: %Schema{
              type: "integer",
              format: "int64",
              example: 20,
              readOnly: true
            },
            total_count: %Schema{
              type: "integer",
              format: "int64",
              example: 1,
              readOnly: true
            }
          }
        }
      }
    }
  end

  defp default_headers() do
    %{
      "content-type" => DocsWeb.Headers.XArtaRequestID.header(),
      "x-arta-request-id" => DocsWeb.Headers.ContentTypeAppJson.header()
    }
  end
end
