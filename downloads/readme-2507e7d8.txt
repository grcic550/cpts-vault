# Grcan's CPTS Vault — Mintlify

This is the active website. `../Archive/Mintlify Snapshot/` is the former `docs` copy, and `../Archive/Legacy Web Vault/` contains the older visual project.

## Updating notes

This checkout is the website repository. The parent Obsidian vault, maintenance scripts, and recovery archives are local; they are not included in a website-only GitHub clone.

1. Edit the organized Markdown source for pages marked `generated: true` in `../scripts/site-content.json`. Edit the `.mdx` directly for hand-maintained pages.
2. From the parent vault, run `python3 scripts/refresh_site.py` to refresh pages, exact section links, the tool directory, local indexes, task search, and navigation together.
3. Run the preservation and consistency checks, then preview and validate before publishing.

The refresh needs Node on your PATH. For first setup, install its pinned parser dependencies with `npm install --prefix scripts` from the parent vault. An existing dependency directory can be selected with `CPTS_SITE_TOOLS`; `CPTS_NODE` can select a Node executable. The Mintlify CLI was validated at version **4.2.876** for this pass.

For a new page, add its source/page mapping to `site-content.json`, metadata to `page-metadata.json`, and sidebar placement to `refresh_site_navigation.py`. Add practical search tasks to `task-directory.json`; a `heading` field links directly to the matching section. Then run the refresh command. Every published page is included in the task finder's title/keyword index automatically.

The task finder sources are `task-search.mjs`, `task-finder-component.jsx`, and `task-directory.json` in the parent scripts folder. `snippets/vault-task-finder.jsx` is generated. Do not edit the generated snippet directly. The existing Mintlify theme is retained, with scoped task-finder styles in `style.css`.

The home page and other hand-maintained bodies retain direct edits. Shared frontmatter and marked quick-navigation blocks are refreshed from metadata. `sync_site.py --check` detects stale outputs; `check_vault.py` checks page coverage, task anchors, source preservation, and metadata.

## Local preview and validation

Install the Mintlify CLI in your usual Node environment, then run these inside this folder:

```bash
npx mint dev --no-open
npx mint validate --disable-openapi
npx mint broken-links --check-anchors
```

The validator checks documentation, not the behavior of the security-tool examples. No lab commands are executed by the sync or validation scripts.

From the parent folder, run `python3 scripts/check_vault.py` and `node scripts/test_task_search.mjs`. The latter checks common queries, first-result ranking, spelling variants, and topic filtering. The files `prepare_notes.py`, `organize_vault.py`, `import_site_references.py`, `prepare_findability.py`, and `import_ad_continuation.py` record one-time migrations; do not rerun them over edited notes.

Mintlify’s native full-text search in local preview requires Mintlify login. The interactive task finder, static task index, and note catalogue work without it. The hosted site also has native full-text search; the task finder searches task descriptions, note titles, and keywords.

## Publishing

The existing repository is `https://github.com/grcic550/cpts-vault`. The live site is https://dashboard-aed21664.mintlify.site/. Keep its existing repository connection and main branch. The missing local Git objects were recovered from GitHub on 8 September 2026. The full Shells & Payloads guide is restored, and the former Common Services page is preserved under `modules/common-services/full-reference.mdx`.

Commit and push the validated website changes to the connected branch. A local edit alone does not update the hosted Mintlify page; check the deployment status in the Mintlify dashboard after pushing. Keep the existing Mintlify deployment rather than moving this project to another host.

Official instructions: [Mintlify CLI](https://www.mintlify.com/docs/cli/commands) · [Navigation](https://www.mintlify.com/docs/organize/navigation).
