# FinzData MCP server for Glama and any Docker-based MCP host.
# Bridges stdio to the live FinzData remote server (Streamable HTTP), so every current tool is exposed.
# Free preview works without a key; set FINZDATA_API_KEY for full history and intraday bars.
FROM python:3.12-slim
RUN pip install --no-cache-dir "mcp-proxy>=0.8"
ENV FINZDATA_MCP_URL=https://api.finzdata.com/mcp
CMD ["sh", "-c", "if [ -n \"$FINZDATA_API_KEY\" ]; then exec mcp-proxy --transport streamablehttp -H Authorization \"Bearer $FINZDATA_API_KEY\" \"$FINZDATA_MCP_URL\"; else exec mcp-proxy --transport streamablehttp \"$FINZDATA_MCP_URL\"; fi"]
