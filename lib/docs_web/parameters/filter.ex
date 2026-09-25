defmodule DocsWeb.Parameters.Filter do
  alias OpenApiSpex.{Parameter, Schema}

  @syntax """
  Narrow the returned collection with one or more clauses. Every clause is applied: a request \
  returns exactly the records all of them hold for, or is refused with a `400` naming what was \
  at fault. A clause this parameter cannot express is never dropped silently.

  Each clause names a field, an operator and a value. Clauses on different fields all have to \
  hold, and repeating a text field matches any of its values:

  ```
  status:failed type:self_ship_label
  status:failed status:accepted
  ```

  **Operators**

  | Operator | Usage | Description | Example |
  |---|---|---|---|
  | `:` | `field:value` | Matches the value | `status:failed` returns records whose status is `failed` |
  | `-` | `-field:value` | Returns records holding a different value. Records holding no value are returned by neither the clause nor its negation. Text fields only | `-status:delivered` returns records with another status, and not those whose status has not been reported |
  | `>=`, `>`, `<=`, `<` | `field:>=value` | Compares a date field | `created_at:>=2026-09-01` returns records created on or after 1 September 2026 |
  | `..` | `field:from..to`, `field:from..`, `field:..to` | A range over a date field, both ends included, either end optional | `created_at:2026-09-01..2026-09-07` returns records created in that week |

  Date fields are in UTC, and a bare date names the whole UTC day it falls in, so \
  `created_at:2026-09-01` covers that day end to end, while `created_at:>2026-09-01` starts after \
  it, at midnight on 2 September. Use `>=` and `<=` to include the day named.

  For a narrower bound give an ISO 8601 timestamp in quotation marks, which the clause needs \
  because the value itself carries a `:`. An offset in the timestamp is resolved to the UTC \
  instant it names:

  ```
  created_at:>="2026-09-01T09:30:00Z"
  ```

  A date field carries at most one lower bound and one upper bound across the whole filter, and a \
  bare date sets both, so a bare date cannot be combined with another clause on the same field. \
  Two comparisons that bound opposite sides are read as the span between them, as in \
  `created_at:>=2026-09-01 created_at:<=2026-09-10`, while bounds that cross are refused.

  **Refusals**

  A clause this endpoint cannot apply is refused with a `400` naming what was at fault — an \
  unknown field, an operator the field does not support, a value it cannot read. Wildcards and \
  bare terms without a field are refused too. Clauses are combined with AND implicitly: the words \
  `AND`, `OR` and `NOT`, and parentheses, are not part of the syntax and are refused. So is a \
  filter longer than 2,000 bytes.\
  """

  @doc """
  The `filter` query parameter for a list endpoint.

  `fields:` is the table of filterable fields for the endpoint, appended to the shared syntax so
  each endpoint documents what it opens rather than inheriting another's.
  """
  @spec parameter(keyword()) :: Parameter.t()
  def parameter(opts \\ []),
    do: %Parameter{
      name: "filter",
      description: description(Keyword.get(opts, :fields)),
      in: :query,
      required: false,
      example: Keyword.get(opts, :example),
      schema: %Schema{
        type: "string"
      }
    }

  defp description(nil), do: @syntax
  defp description(fields), do: @syntax <> "\n\n" <> fields
end
