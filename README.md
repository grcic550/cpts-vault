# Grcan's CPTS Vault — Mintlify

This is the active website interface for the parent Obsidian vault. The source notes remain the complete personal knowledge base. `../Archive/Mintlify Snapshot/` and `../Archive/Legacy Web Vault/` are historical implementations.

## Refreshing the website

This folder is the website repository. The parent Markdown notes, maintenance scripts and recovery archives are local; a website-only GitHub clone does not include them.

From the parent vault, use the website-only refresh:

```bash
python3 -B scripts/refresh_search.py
```

This refresh updates website presentation, navigation and retrieval assets while preserving the existing Obsidian notes. It uses the existing local runtimes and parser dependencies. `CPTS_NODE` selects a Node executable and `CPTS_SITE_TOOLS` selects an existing dependency directory. It does not install packages, execute lab commands, push commits or deploy the site.

The broader `refresh_site.py` maintenance pipeline can regenerate local derived notes as well as website outputs. Use it only when that broader regeneration is intended. The one-time migration scripts `prepare_notes.py`, `organize_vault.py`, `import_site_references.py`, `prepare_findability.py` and `import_ad_continuation.py` must not be rerun over edited notes.

Pages marked `generated: true` in `../scripts/site-content.json` come from their mapped Markdown sources. Edit the source when intentionally changing its content; edit hand-maintained MDX bodies directly. Preserve complete explanations, commands, output, caveats and personal observations. Overlapping quick references, lessons and assessment notes remain separate pages with explicit links between them.

The important maintenance files in `../scripts/` are:

| File | Responsibility |
| --- | --- |
| `site-content.json` | Source-to-page mapping and generated-page status |
| `page-metadata.json` | Titles, aliases, descriptions, content roles and additive related-page links |
| `build_primary_search.py` | Builds the active finder component and its website assets |
| `task-directory.json` | Existing reviewed task shortcuts and their destination headings |
| `command-catalog.json` | Tool aliases, quick command blocks and related references |
| `site-headings.json` | Generated section IDs using the existing Mintlify heading utilities |
| `build_subject_library.py --site-only` | Subject metadata and relationships without rewriting `Subjects/*.md` or `00_START_HERE.md` |
| `refresh_site_navigation.py` | Original six-tab/sidebar layout with additive locations for new pages |
| `site_enrichment.py` | Additive presentation blocks around preserved page bodies |

For a new page, register its source mapping and metadata, then run the website refresh. Subject assignment supplies its normal navigation location; an unassigned page remains reachable in Start → Additional notes. Add cross-topic relationships through `relatedPages` entries with `title`, `href` and `description`. Add a reviewed task shortcut only when it provides a useful route into existing content.

The home page and `/find-anything` use the same active finder. Search includes tool sheets, preserved notebook examples, reviewed tasks, note sections and practice references. Source links open the original heading; quick sheets also lead back to their full references. The notebook page retains its subject, tool and source filters. Generated snippets should be changed through their builders and source components.

The older `vault-task-finder.jsx`, `task-finder-component.jsx` and `task-search.mjs` remain for compatibility and the existing offline reader. Their tests are useful checks of those components, but passing them alone does not verify the active search page. Mintlify's native search is a separate service; the custom finder does not depend on native-search login or indexing.

## Verification and preview

The six HTB web modules supplied on 2026-10-28 are stored in `../Web/HTB Modules/`, with byte-identical originals in `Sources/`. `scripts/import_htb_modules.py` maintains readable copies and records source hashes in `scripts/htb-module-import.json`; normal refreshes verify these copies without rewriting them. The six enumeration methodology guides are additive notebook sources, surfaced near each tab's overview. Existing quick references remain intact. Imported examples appear in the complete notebook browser and its tool filters without rewriting the existing local tool recipe sheets.

For this import, also run `python3 -B scripts/import_htb_modules.py --check`, `node scripts/test_htb_modules.mjs`, and `node scripts/check_content_preservation.mjs --baseline scripts/import-audits/2026-10-28-before-htb-modules --self-test` from the parent vault. The durable local baseline covers the 432 pre-existing vault files and all 407 pre-import website pages.

From the parent vault, run the active search and relationship checks after refreshing:

```bash
node scripts/test_unified_search.mjs
node scripts/test_primary_search.mjs
node scripts/test_navigation_relationships.mjs
node scripts/check_content_preservation.mjs --site-ref 618adf01038018a466322dd19b73686343c001bf --self-test
python3 -B scripts/test_source_preservation.py
python3 -B scripts/check_vault.py
```

The preservation checks must compare original source bytes and saved examples before and after a website refresh. Search checks cover realistic task descriptions, synonyms, tool names, flags, errors and source destinations. Navigation checks verify unique route coverage, the original sidebar layout, related full references and assessment links. Existing command, task, service, workspace and practice tests remain regression coverage; browser checks must also exercise the component actually mounted on the home and search pages.

The pinned Git check verifies the original website prose and code; it does not claim to verify historical vault bytes. The website-only refresh separately hashes existing vault files before and after each run. Notebook downloads and tool/subject filters are republished from the current extraction before the final source-link refresh. The original stylesheet, theme configuration, home-page layout and subject illustrations are retained.

For a full visual preview without downloads or installs, run `node scripts/preview_mintlify.mjs --port 4179` from the parent folder. It copies the already cached Mintlify client into a temporary folder, builds the actual local pages, and serves the original theme at `http://127.0.0.1:4179/`. It requires an existing cached client and does not modify it. Restart after changing source files. The older `preview_search.mjs` is only a component test harness; its simplified page framing must not be presented as the website design.

Use an already installed Mintlify CLI for local preview and documentation validation inside this folder:

```bash
mint dev --no-open
mint validate --disable-openapi
mint broken-links --check-anchors
```

If the CLI is not on PATH, select its existing local installation. These checks validate documentation and navigation; they do not run the security-tool examples. Confirm in the preview that search results open the relevant heading, accordions reveal preserved recipes, filters and bookmarks restore, and saved references appear in My workspace. Browser storage belongs to that browser and site address; keep the existing JSON backup/export workflow when moving between hosted and offline copies.

## Publishing

The existing repository is [grcic550/cpts-vault](https://github.com/grcic550/cpts-vault), and the hosted interface is [Grcan's CPTS Vault](https://dashboard-aed21664.mintlify.site/). Local edits and validation do not publish a deployment. Commit, push and deployment changes require a separate publishing instruction. Keep the existing Mintlify repository connection and hosting.

## Preserved earlier maintenance instructions

The following original maintenance reference is retained in full. The website-only workflow above is the current entry point; this earlier text describes the previous finder and broader refresh process.

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
