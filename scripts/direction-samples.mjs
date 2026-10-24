// Print real sample sites for taste-skill directions, so the user can click them before picking one.
// Usage: node scripts/direction-samples.mjs <direction-id> [...]   (ids come from draw.mjs --options 3)
import { readFileSync } from 'node:fs'

const lib = new URL(
  '../.claude/skills/design-taste-frontend/library/',
  import.meta.url,
)
const load = (file) => JSON.parse(readFileSync(new URL(file, lib), 'utf8'))
const directions = load('directions.json')
const sites = new Map(load('sites.json').map((site) => [site.id, site]))

const ids = process.argv.slice(2)
if (ids.length === 0) {
  console.error('Usage: npm run samples -- <direction-id> [...]')
  process.exit(1)
}

for (const id of ids) {
  const direction = directions.find((d) => d.id === id)
  if (!direction) {
    console.error(`Unknown direction '${id}'.`)
    process.exitCode = 1
    continue
  }
  console.log(`## ${direction.name} (${id})`)
  console.log(direction.idea)
  for (const siteId of direction.seenIn) {
    const site = sites.get(siteId)
    if (!site) continue
    const swatches = site.colour.split(' — ')[0]
    console.log(`- ${site.name}: ${site.url}`)
    console.log(`  mood: ${site.mood.join(', ')} | colours: ${swatches}`)
  }
  console.log()
}
