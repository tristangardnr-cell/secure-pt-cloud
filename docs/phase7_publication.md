# Phase 7 - publication and backup runbook

Prepared October 15, 2026. Local release preparation is complete; remote publishing and WSL synchronization must be verified before marking Phase 7 complete.

## Prepared locally

- Publication audit: 22 historical Git blobs and 29 current text files scanned for selected credential patterns, with no findings at scan time. This records the screening performed; it is not a claim that every possible secret format was detected.
- Clean release allowlist: README, .gitignore, Terraform source/provider lock file, documentation, diagrams, screenshots, and reviewed scripts.
- State, .terraform caches, private variables, keys, .git internals, and private OpenClaw/business archives are excluded from the clean release.
- [Resume and LinkedIn drafts](job_presentation.md).
- [Publication audit](publication_audit.json).

## Before publishing

1. Sign in to GitHub in the connected browser; select the owner and confirm repository name/visibility. Suggested name: secure-pt-cloud.
2. For an existing repository, inspect its contents before any upload/push; do not replace remote history.
3. Synchronize reviewed documentation to WSL using the supplied script. It backs up the prior documentation first and does not copy Terraform source or state.
4. Inspect git status and diff in the original WSL repository.
5. Commit selected project files, preserving existing deployment commits.
6. Add the verified remote and push without force.
7. Verify the published README, diagram, screenshot links, and file tree. Ensure no state/private archive was uploaded.
8. Add the actual URL to the job drafts. Posting to LinkedIn remains a separate action.

## WSL documentation sync

Run the supplied script from Ubuntu using its Windows-mounted path. The script validates the target repository, backs up existing documentation, copies README/docs/diagrams/screenshots/scripts, and displays Git status. It does not commit, push, apply Terraform, or delete files.

```bash
bash /mnt/c/Users/savib/Documents/Codex/secure-pt-cloud/scripts/sync-docs-to-wsl.sh
```

The assistant could not directly access WSL during release preparation. A successful script result must be checked before claiming synchronization.

## Backup scope

The clean release ZIP is a portable source-and-documentation snapshot, not a full disaster-recovery backup of deployed Terraform state. Keep the original WSL state safely; the private OpenClaw backup is separate. The Windows .git copy still preserves the existing commit history locally.
