import type { Plugin } from "@kilocode/plugin"

const DANGEROUS = [
  /\bgit\s+push\s+.*--force\b/i,
  /\bgit\s+reset\s+--hard\b/i,
  /\brm\s+-rf\b/i,
  /\bRemove-Item\b.*\b-Recurse\b.*\b-Force\b/i,
  /\bDROP\s+(DATABASE|SCHEMA|TABLE)\b/i,
  /\bTRUNCATE\s+TABLE\b/i,
]

const SecurityGuard: Plugin = async ({ client }) => ({
  "tool.execute.before": async (input, output) => {
    if (input.tool === "read") {
      const candidate = String(output.args.filePath ?? output.args.path ?? "")
      if (/(^|[\\/])\.env(?:\.|$)/i.test(candidate) || /\.(pem|key)$/i.test(candidate)) {
        throw new Error("Security guard blocked reading a likely secret file.")
      }
    }

    if (input.tool === "bash") {
      const command = String(output.args.command ?? "")
      if (DANGEROUS.some((pattern) => pattern.test(command))) {
        throw new Error("Security guard blocked a destructive command. Run it manually only after review.")
      }
    }
  },

  event: async ({ event }) => {
    if (event.type === "session.idle") {
      await client.app.log({
        body: {
          service: "project-harness",
          level: "info",
          message: "agent session became idle",
        },
      })
    }
  },
})

export default { id: "security-guard", server: SecurityGuard }
