# PublicDataHub export API

> Every response carries the agency, dataset, licence and effective date of the figures it contains. Values are reproduced from official federal releases and are never modelled or estimated; a null is a value the agency did not publish and never means zero.
>
> No key and no rate limit. `robots.txt` disallows `/api/` for crawl budget, not permission, an on-demand request for one named record is expected and welcome; walking every slug is not. CSV twins of each export (/api/export/hospital/&#123;slug&#125;.csv, /api/export/agency/&#123;slug&#125;.csv, /api/export/school/&#123;slug&#125;.csv, /api/export/district/&#123;slug&#125;.csv) were removed on 2026-10-23: one entity cannot load from both a JSON and a CSV route.

## Start here

This guide introduces the API, the client libraries, and the companion tools in this repository. Start with the API capabilities, choose a client for your application, and use the linked reference when you need exact request and response details.

The selected API surface contains 2 entities and 5 HTTP routes. There are 6 SDK targets and 2 companion tools.

An entity groups related API operations. An operation can have several routes with different inputs or authentication requirements. The SDK exposes the entity and its operations using the conventions of the selected language.

## What the API provides

### Slug

Results: The agency record; The district record; The hospital record; The school record.

SDK operations: `list`.

Key fields to recognise:

- `key`: Stable identifier for the measure
- `national_count`: How many records the rank is out of
- `national_rank`: Rank within this entity type only, respecting the direction of the measure, so a low value wins where low is better. Never comparable across entity types.
- `value`: null means the agency published no value for this record. It never means zero, and the two must not be conflated downstream.

### Status

Results: Service reachable; every shard answered.

SDK operations: `load`.

### Route map

Use this map to locate a capability. Consult the entity reference before supplying request data; routes for the same operation can require different fields.

| Entity | SDK operation | HTTP route | Authentication |
| --- | --- | --- | --- |
| Slug | `list` | `GET /api/export/agency/{slug}.json` | See reference |
| Slug | `list` | `GET /api/export/district/{slug}.json` | See reference |
| Slug | `list` | `GET /api/export/hospital/{slug}.json` | See reference |
| Slug | `list` | `GET /api/export/school/{slug}.json` | See reference |
| Status | `load` | `GET /api/status` | See reference |

## Connect to the API

- API server: `https://publicdatahub.org`

Check authentication for the route you plan to call. A route that declares no authentication can be used without credentials; this does not change the requirements of other routes. Keep credentials in environment variables or a configured secret provider, and keep them out of source control and logs.

## Make a first request

1. Choose the API server and an operation that matches your task.
2. Check the operation’s required input and authentication. Use values valid for your account and environment.
3. Send one request and inspect the returned data before adding retries, concurrency, or a larger batch.

For an SDK call, install or build the chosen client, create a client instance with its documented configuration, and call the required entity operation. Language references describe the argument shape, asynchronous behaviour, and returned values.

## Choose an SDK

Choose the language already used by your application or service. The clients represent the same API model, while package setup, naming, and return types follow each language. Check the selected client’s reference and tests before integrating it into an existing application.

| Client | Repository directory | Distribution |
| --- | --- | --- |
| Golang | `go/` | Build from source |
| Lua | `lua/` | Build from source |
| PHP | `php/` | Build from source |
| Python | `py/` | Build from source |
| Ruby | `rb/` | Build from source |
| TypeScript | `ts/` | Build from source |

Build-from-source entries are not marked as published in the project model. Follow the build instructions in that target’s README, then consume the resulting package using your language’s local dependency mechanism. Published entries give the installation command recorded for that client.

## Companion tools

These targets provide another way to use the API. Their available commands or tools can cover a smaller set of operations than the client libraries.

### Go CLI

Use the command-line interface for shell-based tasks and scripts.

Repository directory: `go-cli/`. Not published. Build from the go-cli directory.


### Go MCP server

Use the MCP server to expose supported API operations to an MCP client.

Repository directory: `go-mcp/`. Not published. Build from the go-mcp directory.

- `public-data_list`: List records for an entity. Supported entities: `slug`.
- `public-data_load`: Load one record for an entity. Supported entities: `status`.

## Operational features

Features supply behaviour around API calls, such as request handling, diagnostics, or local testing. Inclusion in this project does not mean a feature is enabled at runtime. Check the selected SDK’s supported features and configuration defaults, then enable the behaviour your application needs.

- `ratelimit`: Client-side rate limiting via a token bucket
- `retry`: Automatic retry of transient failures with exponential backoff
- `test`: In-memory mock transport for testing without a live server
- `timeout`: Per-request timeout with transport abort

Start with the default client configuration. Add request limits and diagnostics as needed, test error paths, and review retry behaviour before using operations that change data. A retry can repeat an operation unless the API provides a suitable guarantee.

## Continue with the documentation

- Follow the first-call guide for the setup sequence.
- Read the authentication guide before using protected routes.
- Use the API reference for request schemas, response formats, and status codes.
- Check the chosen SDK or companion tool reference for its configuration and supported operations.

