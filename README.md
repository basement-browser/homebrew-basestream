# Basestream

**Your team uses AI every day. Now you can see what it's building.**

Basestream automatically tracks what your developers build with AI tools and gives engineering leaders visibility into AI-powered output — no manual logging, no workflow changes.

[basestream.ai](https://basestream.ai)

---

## Install

```bash
brew tap basement-browser/basestream
brew install basestream
```

Then run:

```bash
basestream init
```

This will:

1. Authenticate with your Basestream account
2. Configure automatic session tracking
3. Start capturing work in the background

### Update

```bash
brew upgrade basestream
```

## How it works

Basestream runs silently alongside your AI tools. At the end of each session, it captures what was built — files changed, commits made, tools used, token usage — and syncs it to your dashboard.

**No prompts. No interruptions. No behavior changes required.**

### Supported tools

- Claude Code
- Cursor
- GitHub Copilot
- More coming soon

## Commands

```bash
basestream init            # Detect AI tools, inject hooks, authenticate
basestream login           # Authenticate with your Basestream account
basestream skills          # Detect stack & recommend/install contextual skills
basestream status          # Interactive dashboard (sessions, cost, skills)
basestream status --simple # Show plain text summary
basestream sync            # Manually sync buffered entries to Basestream
basestream uninstall       # Remove the Claude Code tracking hook
```

## Dashboard

Your team's AI work shows up at [basestream.ai/dashboard](https://basestream.ai/dashboard):

- **Overview** — Activity feed, heatmap, quick stats
- **Team** — Who's building what, output by person
- **Projects** — Work grouped by repository
- **Scores** — Performance metrics weighted by role
- **Cost Intelligence** — Token spend, tool adoption, before/after efficiency
- **ROI** — Cost per outcome, hours saved, completion rates
- **Integrations** — Connect GitHub, Jira, Notion, Google Calendar, and more

## Plans

| Plan       | Price       | For                                 |
| ---------- | ----------- | ----------------------------------- |
| Personal   | Free        | Individual developers               |
| Team       | $12/user/mo | Engineering teams                   |
| Enterprise | Custom      | Organizations with compliance needs |

## Privacy

- Work entries are scoped to your organization
- Visibility controls: private, team, or public per entry
- No source code is ever captured — only metadata
- API keys are scoped per user, revocable anytime

## Also available via npm

Basestream is also distributed as an npm package:

```bash
npx @basestream/cli init
```

For more details, see the [@basestream/cli package on npm](https://www.npmjs.com/package/@basestream/cli).

## Support

- [Contact us](mailto:support@basestream.ai)

---

Built by [Sublevel Inc.](https://sublevel.tech)
