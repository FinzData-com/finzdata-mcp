# FinzData MCP server

<p align="center"><img src="https://finzdata.com/assets/brand/finzdata-logo-full-square.png" alt="FinzData" width="180"></p>


<!-- mcp-name: io.github.FinzData/finzdata-mcp -->

Research-grade US market data and server-side backtests for AI agents: Claude, ChatGPT, Gemini CLI, Cursor, Kimi, GLM and any MCP client.

**Remote server:** `https://api.finzdata.com/mcp` (Streamable HTTP, MCP 2026-07-28, accepts 2025-06-18 clients)
**Auth:** OAuth 2.1 with PKCE (sign in with your FinzData API key), or the header `Authorization: Bearer YOUR_API_KEY`
**Free key:** https://finzdata.com/signin · Pricing: https://finzdata.com/shop · Agent docs: https://api.finzdata.com/agents.md

## Coverage: everything FinzData covers

**US stocks and ETFs**
- 16,000+ US stocks that have traded on NYSE and Nasdaq since January 2000, delisted names included (survivorship-free)
- 5,100+ ETFs, plus fund and ETF holdings (SEC N-PORT)
- Bars from 1-minute to daily; tick trades (every trade print) for 1,100+ stocks and ETFs over 5 years

**Futures**
- 139 futures markets on CME, Eurex and ICE, every contract since 2007: equity index, rates, currencies, energy, metals, agriculture, volatility and crypto futures
- 1-minute to daily bars, back-adjusted continuous series and the roll calendar

**Options and volatility**
- Point-in-time dealer gamma (GEX) for single stocks, ETFs and the major indexes (SPX, NDX, RUT, VIX, XSP, DJX) since 2010
- End-of-day options chains; the VIX and Cboe volatility indexes with the VIX futures curve

**Indexes, FX and crypto**
- 123 indexes (SPX, NDX, DJI, RUT, VIX term structure, DXY, TNX and more), 1-minute to daily
- 79 FX pairs since 2010, 1-minute to daily
- 512 crypto pairs (Bitcoin since 2013, Ethereum since 2016), 1-minute, 5-minute, hourly and daily

**Fundamentals, ownership and positioning**
- SEC fundamentals as filed, point-in-time; daily point-in-time valuation ratios; earnings dates
- 13F institutional holdings; insider transactions; FINRA short interest and margin debt
- CFTC Commitments of Traders since 1986

**Macro and alternative data**
- 22,700+ macro series with every vintage kept: inflation, jobs, GDP, housing, consumer credit, rates, M1/M2/M3, Fed liquidity, trade and the dollar, Taiwan and Korea chip exports, energy (EIA oil inventories incl. Cushing, natural gas storage, power grid demand by ISO, electricity by state and country, energy futures curves and crack spreads), financial stress and government debt
- Quantitative Model: macro regime labels, nowcast and market-stress probability
- Global Macro Pulse: daily ship transits through 28 chokepoints (Suez, Panama, Hormuz, Malacca, Red Sea, Bosporus, Taiwan Strait, Cape of Good Hope) since 2019, port calls and trade estimates for 2,000+ ports, daily flights by airport, airline and country, US flight delays since 1987, and toll and congestion traffic
- Congressional trades and election spending

**Research tools**
- Server-side backtests with a deflated Sharpe ratio, trial count and reproducible snapshot id; `survivorship_audit`; blind mode
- FinzData Hub: public strategies that re-run free on their full history, fork and publish via MCP; verified forward records
- Every time-series tool takes `as_of` to pin what was knowable on a date

**FinzData Workspace** (`https://workspace.finzdata.com/mcp`)
- A persistent workspace for AI agents with FinzData built in: keep files between sessions, run JavaScript next to the data, re-run strategies into your workspace; one-click sign-in or API key; MCP, REST and OpenAPI

**Clients**
- Remote MCP (`https://api.finzdata.com/mcp`), REST API, Python (`pip install finzdata`), Excel, Google Sheets, LangChain, OpenBB, Claude Desktop extension, Cursor/VS Code one-click installs

## Why FinzData for agents

- **Survivorship-free.** Universes include every company that traded on a date, delisted names included.
- **Point-in-time.** Every data tool takes `as_of`, so answers contain only what was public that day: fundamentals as filed, and macro series as first published (ALFRED vintages).
- **Backtests run on the server.** Describe a strategy and get back CAGR, volatility, Sharpe, drawdown, turnover, a benchmark, an equity curve, a reproducible `run_id` and a deflated Sharpe ratio that counts every variant you tried.

## Tools (40)

- **Data (20):** `search_datasets`, `describe_dataset`, `get_universe`, `get_bars`, `backtest_export`, `get_fundamentals_pit`, `get_macro_vintage`, `get_quant_model`, `get_cot`, `get_gex`, `get_political_spending`, `get_13f`, `get_events`, `get_futures`, `get_futures_rolls`, `get_crypto`, `get_fx`, `get_index`, `get_ticks`, `get_global_pulse`
- **Backtests and compute (6):** `run_backtest`, `run_strategy`, `compare_runs`, `survivorship_audit`, `translate_stockcharts_scan`, `backtest_stockcharts_scan`
- **Strategy Hub (6):** `publish_strategy`, `fork_strategy`, `list_strategies`, `get_strategy`, `star_strategy`, `comment_strategy`
- **Verified records (5):** `register_strategy`, `get_verified_record`, `verified_board`, `verify_chain`, `retire_strategy`
- **MCP directory (3):** `search_mcp_servers`, `get_mcp_server`, `claim_mcp_server`

29 tools are read-only; 7 write to your own Hub/records and 4 run server-side compute.

## Connect

**Claude:** add FinzData from the Claude connector directory, or add a custom connector with `https://api.finzdata.com/mcp`.

**ChatGPT:** add the FinzData app from the ChatGPT directory, or add a connector in developer mode with the URL above.

**Gemini CLI:**
```bash
export FINZDATA_API_KEY=your-key
gemini extensions install https://github.com/FinzData/finzdata-mcp
```

**Cursor** (`.cursor/mcp.json`), **Windsurf, Cline, Kimi CLI, GLM / Z.ai coding tools and any client that takes a remote server:**
```json
{
  "mcpServers": {
    "finzdata": {
      "url": "https://api.finzdata.com/mcp",
      "headers": { "Authorization": "Bearer YOUR_API_KEY" }
    }
  }
}
```

**Clients that only run local (stdio) servers:** `pip install finzdata-mcp` (or `uvx finzdata-mcp`) with `FINZDATA_API_KEY` set. See [README.pypi.md](README.pypi.md).

**FinzData Workspace** (a persistent workspace for agents: files, code runs and strategies next to the data): add `https://workspace.finzdata.com/mcp` as a custom connector and sign in with FinzData, or send `Authorization: Bearer YOUR_API_KEY`. OpenAPI: https://workspace.finzdata.com/openapi.json

**One-click installs** (VS Code, Cursor, Claude Code, Claude Desktop extension): https://finzdata.com/agents

## Example prompts

- "Backtest 12-1 momentum on the 500 most-traded US stocks since 2010, monthly, top 50, 10 bps costs."
- "What was the US unemployment rate for March 2020 as first reported?"
- "How are managed-money traders positioned in gold futures?"
- "Which institutions hold the most NVIDIA shares in the latest 13F quarter?"

## Plans

No key needed to start: the AI preview covers recent history. A free account (email only) adds 1,000 data calls and 5 backtests a day. Paid plans and prepaid credits ($0.001 per data call, $0.05 per backtest) unlock the full history: https://finzdata.com/shop

Data, not investment advice. Support: info@finzdata.com · https://finzdata.com/support · Privacy: https://finzdata.com/privacy
