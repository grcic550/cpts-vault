# Grcan's CPTS Vault — Mintlify

This is the active website. `../Archive/Mintlify Snapshot/` is the former `docs` copy, and `../Archive/Legacy Web Vault/` contains the older visual project.

## Updating notes

1. For generated pages, edit the organized Markdown note in the parent vault.
2. From the vault folder, run `python3 scripts/sync_site.py`.
3. Preview and validate the site before publishing.

`../scripts/site-content.json` maps every local note to its website page. Entries marked `generated: true` are regenerated from Markdown. Other entries point to existing, hand-maintained Mintlify pages; edit their `.mdx` files directly. Editing their Markdown counterpart does not automatically replace the site page. This preserves the site's pre-existing edits. The home page and card-based section indexes also remain hand-maintained.

For a new page, add a source/page mapping to that file, set `generated: true`, run the sync, and add the route to `docs.json`. After adding or moving notes, run `python3 scripts/refresh_indexes.py` and sync again. `sync_site.py --check` checks that generated output is current.

## Local preview and validation

Install the Mintlify CLI in your usual Node environment, then run these inside this folder:

```bash
npx mint dev --no-open
npx mint validate --disable-openapi
npx mint broken-links
```

The validator checks documentation, not the behavior of the security-tool examples. No lab commands are executed by the sync or validation scripts.

For the vault's preservation and consistency checks, run `python3 scripts/check_vault.py` from the parent folder. The files `prepare_notes.py`, `organize_vault.py`, and `import_site_references.py` record the one-time migration and should not be rerun over edited notes.

Local preview search requires Mintlify login; the task index and note catalogue work without it.

## Publishing

The existing repository is `https://github.com/grcic550/cpts-vault`. Confirm the branch and documentation directory connected in your Mintlify dashboard before publishing. The missing local Git objects were recovered from GitHub on 8 September 2026. The full Shells & Payloads guide is restored, and the former Common Services page is preserved under `modules/common-services/full-reference.mdx`.

Commit and push the validated website changes to the connected branch. A local edit alone does not update the hosted Mintlify page; check the deployment status in the Mintlify dashboard after pushing. Keep the existing Mintlify deployment rather than moving this project to another host.

Official instructions: [Mintlify CLI](https://www.mintlify.com/docs/cli/commands) · [Navigation](https://www.mintlify.com/docs/organize/navigation).
