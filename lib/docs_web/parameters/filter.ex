defmodule DocsWeb.Parameters.Filter do
  alias OpenApiSpex.{Parameter, Schema}

  @syntax """
  Narrow the returned collection with one or more clauses. Every clause is applied: a request \
  returns exactly the records the filter describes, or is refused with a `400` naming what was \
  at fault. A clause this parameter cannot express is never dropped silently.

  Each clause names a field, an operator and a value. Clauses on different fields all have to \
  hold. Repeating a text field matches any of its values, and repeating its negation excludes \
  all of them:

  ```
  status:failed type:self_ship_label
  status:failed status:accepted
  ```

  **Operators**

  | Operator | Usage | Description | Example |
  |---|---|---|---|
  | `:` | `field:value` | Matches the value | `status:failed` returns records whose status is `failed` |
  | `-` | `-field:value` | Returns records holding a different value. Records holding no value are returned by neither the clause nor its negation; match them with `null`. Text fields only, except `-field:null`, which date fields take too | `-status:delivered` returns records with another status, and not those holding no status |
  | `null` | `field:null`, `-field:null` | Matches records holding no value for the field, or with `-`, those holding one. Text and date fields, in any case, unless the endpoint's field table says otherwise | `status:null` returns records holding no status |
  | `>=`, `>`, `<=`, `<` | `field:>=value` | Compares a date field | `created_at:>=2026-09-01` returns records created on or after 1 September 2026 |
  | `..` | `field:from..to`, `field:from..`, `field:..to` | A range over a date field, both ends included, either end optional | `created_at:2026-09-01..2026-09-07` returns records created in that week |

  Date fields are in UTC, and a bare date names the whole UTC day it falls in, so \
  `created_at:2026-09-01` covers that day end to end, while `created_at:>2026-09-01` starts after \
  it, at midnight on 2 September. Use `>=` and `<=` to include the day named.

  For a narrower bound give an ISO 8601 timestamp, quoted, since any value containing a `:` has \
  to be. A timestamp takes `:`, `>`, `>=`, `<` and `<=`, while a range takes dates only. An offset \
  in it is resolved to the UTC instant it names:

  ```
  created_at:>="2026-09-01T09:30:00Z"
  ```

  A quoted timestamp names the second it is written to, or the fraction of a second it gives, as \
  a bare date names its day, and every operator reads it the same way: `:` covers that span, `>` \
  starts after it ends, `<=` runs to its end, and `>=` and `<` start at its beginning.

  A date field carries at most one lower bound and one upper bound across the whole filter, and a \
  bare date sets both, so a bare date cannot be combined with another bound on the same field. \
  Two comparisons that bound opposite sides are read as the span between them, as in \
  `created_at:>=2026-09-01 created_at:<=2026-09-10`, while bounds that cross are refused.

  **No value**

  `null` names a record holding no value for a field. Repeating a text field with `null` matches \
  its values or no value:

  ```
  status:null
  status:failed status:null
  -sent_at:null
  ```

  `null` takes no comparison or range. Beside `field:null`, a text field takes only further \
  `field:value` clauses, which widen it as shown above. Any other clause on the same field is \
  refused, since a record holding no value could never also hold it, so \
  `status:null -status:failed` is refused. Quotes do not change it: `status:"null"` reads as \
  `status:null`.

  **Refusals**

  A clause this endpoint cannot apply is refused with a `400` naming what was at fault — an \
  unknown field, an operator the field does not support, a value it cannot read, `null` given as \
  a bound, or a clause matching `null` beside another clause on its field. Wildcards and \
  bare terms without a field are refused too. Clauses are combined with AND implicitly: the words \
  `AND`, `OR` and `NOT`, and grouping with parentheses, are not part of the syntax. Those words and \
  a clause opening with a parenthesis are refused, while a parenthesis inside a value is read as \
  part of that value. A filter longer than 2,000 bytes is refused too.\
  """

  @doc """
  The `filter` query parameter for a list endpoint.

  `fields:` is the table of filterable fields for the endpoint, appended to the shared syntax so
  each endpoint documents the fields it opens.
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
