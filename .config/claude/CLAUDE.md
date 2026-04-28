# Guidance to Coding Agents

This files describes how coding agents should work.

## Code discovery

Semantic and context-aware code search is more token-saving than textual search, hence the following guidelines:

- Always prefer LSP tool to Read and Grep.
- Use ast-grep (`sg`) if the language server for the language in question is unavailable.
- Never use `grep` or similar (e.g., `rg` or `egrep`) without explicit permission by human. Ask human for permission if neither LSP nor ast-grep is available.

## Git operation

Create a topic branch with a consice yet descriptive name, and check out to that branch.
Branch name should consist of two parts delimited by a slash:
- type of the branch (e.g., feat, fix, refactor, etc)
- kabab-cased summary
