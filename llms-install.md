# Installing the FinzData MCP server (for Cline and other AI agents)

FinzData is a remote MCP server. Nothing to build or run locally.

## Cline

Open Cline → MCP Servers → Configure (or edit `cline_mcp_settings.json`) and add:

```json
{
  "mcpServers": {
    "finzdata": {
      "type": "streamableHttp",
      "url": "https://api.finzdata.com/mcp"
    }
  }
}
```

That is all. No API key is needed to start: the AI preview gives every one of the 40 tools on the last 6 months of data.

For full history, add your FinzData API key (get one free at https://finzdata.com/account, full history at https://finzdata.com/shop):

```json
{
  "mcpServers": {
    "finzdata": {
      "type": "streamableHttp",
      "url": "https://api.finzdata.com/mcp",
      "headers": { "Authorization": "Bearer YOUR_FINZDATA_API_KEY" }
    }
  }
}
```

## Check it works

Ask: "Use FinzData search_datasets to find housing data." The server returns matching datasets.

## Persistent workspace (optional)

Add a second server for a workspace that keeps files between sessions and runs JavaScript next to the data:

```json
"finzdata-workspace": { "type": "streamableHttp", "url": "https://workspace.finzdata.com/mcp" }
```

## Local alternative

`pip install finzdata-mcp`, set `FINZDATA_API_KEY`, and run `finzdata-mcp` as a stdio server.
