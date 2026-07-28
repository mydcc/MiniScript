# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working in this repository.

## Project Overview

**Tegaland** is a 3D metaverse-creation platform (frontend + backend) built on the **Unity** game
engine, running on the **Chaarmi** platform (chaarmi.org / xrxplorer.com). Within the Chaarmi
backend, the 3D space of a plot ("Plot") is programmed interactively using **MiniScript**.

This repository is **not** the Unity project or the platform backend itself — it is a
**MiniScript script library**: a flat collection of standalone `.ms` scripts, reference docs, and
plot-export dumps. There is no build system, package manager, or local interpreter/CLI. A script
is written here, then copy-pasted into the web-based **Backend Plot Editor** and attached to an
object in a Plot, where it is tested live in the browser/Unity client. Claude cannot execute or
lint MiniScript in this environment — see "Working in This Repo" below.

## Repository Structure

- **`AGEND.md`** — the previous, condensed system-prompt/agenda for a MiniScript assistant
  (role, quick syntax reference, platform constraints, compact command reference). It is now
  **superseded by this file** for day-to-day guidance, but its content is accurate and is folded
  into the sections below; keep it around as historical context.
- **`CustomCommands.md`** — the canonical, full reference for every custom Tegaland/Chaarmi
  command (`moveObject`, `playVideo`, `makeNPC`, …), including the complete 0–101 avatar
  animation ID list. Treat it as the source of truth for exact command signatures.
- **`commands.ms`** — a worked example combining several custom commands, including a
  `networkCommand`-driven animated nav menu.
- **`MiniScript_Manual.pdf`, `MiniScript_QuickRef.pdf`, `MiniScript_WhatIsMiniScript.pdf`** —
  generic, upstream MiniScript language documentation (Joe Strout). Not Tegaland-specific; only
  consult these for core-language questions not answered by the quick reference below (e.g. exact
  `function`/closure semantics).
- **`*.ms` in the repo root (~100 files)** — a **reference library** of real Plot scripts: NPCs,
  cameras, VFX, UI buttons, sound/video triggers, a rocket-launch sim, a card game, etc. Treat
  these as read-only inspiration for patterns, not a package to import. **Do not rename, dedupe,
  "clean up", or delete these files unless explicitly asked to.** Inconsistent names (spacing,
  casing, `.bak` suffixes, near-duplicates like `adSystem.ms` / `adsystem.ms`) are historical, not
  accidental clutter to fix on sight — each may be a distinct script pulled from a specific object.
- **`genesis_03-2026.txt`, `objects_tegaland.txt`** — raw exports of an actual Plot ("Genesis"):
  a flat object-name/world-position list, and a full pipe-delimited plot export with embedded
  per-object scripts and trigger types (`OnClick`, `TriggerEnter`, `None_DoOnce`, `None`, …).
  Useful as real-world evidence of how scripts attach to objects and which trigger types exist,
  but they are generated/exported data — don't hand-edit them. Treat trigger-type names found
  here as *observed*, not officially documented; verify with the user if it matters for a task.

## MiniScript Quick Reference

(Condensed from `AGEND.md`; see there / the PDFs for full detail.)

- **Numbers:** full-precision floats; `1` / `0` represent true / false.
- **Strings:** double-quoted; escape a literal quote by doubling it: `"He said ""Hello""."`
- **Lists:** `[1, 2, "three"]`, zero-based indexing (`list[0]`).
- **Maps:** `{"key": "value", "id": 101}`.
- **Control flow:** `if / else if / else / end if`, `while / end while`,
  `for i in range(start, end, step) / end for`, `for item in list / end for`.
- **Operators:** `+ - * / % ^` (arithmetic), `and or not == != < > <= >=` (logic).
- **Built-ins used throughout this repo's scripts:** `rnd`, `round(x[, decimals])`,
  `range(start, end, step)`, `floor`, `sin`, `cos`, `atan`, `pi`, `time`, `wait seconds`,
  `list.len`, `list.shuffle`.

## Platform Constraints (CRITICAL — do not violate)

- `new`, `create`, `input`, and `print` are **disabled** on this platform. Never use them.
- All user-facing output must go through `messageBox sTitle, sMessage`.
- **Scope is strictly object-bound.** There is no persistent global state or shared variables
  between objects/scripts. To chain behavior across objects, use `runObjectCode sObjectName`.
- **Local vs. networked effects (observed pattern — verify if it's critical to a task):** a direct
  call to a transform/effect command (`moveObject`, `scaleObject`, `rotateObject`, …) only affects
  the local execution context of the script that calls it. To make a change visible to *all*
  connected players, route it through `networkCommand sObject, sCommand, sData` instead of calling
  the command directly. Most multi-user-visible effects in this repo follow this pattern (e.g. the
  nav menu in `commands.ms`, or the ball reset in the goal-trigger scripts inside
  `genesis_03-2026.txt` — note in that same file a `referee` object is moved *without*
  `networkCommand`, consistent with it being an intentionally per-player-local cutscene, similar to
  `makeNPC` below).
- `playVideo` attaches its stream to the object executing the code.
- NPCs created with `makeNPC` are local per player — other users don't see them rotate or
  interact; each player triggers their own instance.
- Media assets (mp3/mp4/textures) must be uploaded to the `my-content` server (via FileZilla) and
  referenced by that URL — an arbitrary external URL will typically hit a CORS error for
  audio/video.

## Custom Command Reference (summary — full details in `CustomCommands.md`)

Legend: `s` = string (`"Name"`), `f` = float (`0.2`).

- **Transform / Physics:** `moveObject`, `rotateObject`, `scaleObject` (all `sName, fX, fY, fZ`) ·
  `renameThisObject sNewName` · `removeCollider sObject`
- **Multimedia:** `playSound sNum(0-50), sLoopType, sDim(2D/3D)` ·
  `playAudio sName, sURL, sLoop, fVol` ·
  `playAmbientAudio sName, sURL, sLoop, f3DRange(-1=2D), fVol` ·
  `playVideo sName, sURL, sLoop, fVol`
- **World / Navigation:** `messageBox sTitle, sMessage` ·
  `plotJump sGalaxy, sPlot, fX, fY, fZ, fRot` · `localJump sObjectName` · `openURL sURL` ·
  `runObjectCode sObjectName` · `networkCommand sObject, sCmd, sData`
- **Interaction / NPC:** `makeNPC sObj, fYOff, fTime, sRole, sM1..sM5, sMode(random/sequential), sSFX, sGPT, sCode, sTurn` ·
  `examineObject sName, fDist, sHex, sTitle, sDesc` ·
  `examineObjectWithButton sName, fDist, sHex, sTitle, sDesc, sBtnT, sBtnU` ·
  `setLightObject sName, sHex, fInt, sShadow(hard/soft), fStr`
- **Animations:** `aniObject sName, sAnimNameOrIndex, sPlayMode, fSpeed` (GLB/GLTF models) ·
  `customAvatarAnim sAnimID, sPlayMode` (player avatar; IDs 0–101, full table in
  `CustomCommands.md`)

## Working in This Repo

- **Writing new scripts:** default to English variable/comment names (matching `AGEND.md`'s own
  style), even though some existing files use German — don't "fix" the language of files you
  aren't otherwise touching for the task at hand.
- **No local test runner exists.** You cannot execute or lint MiniScript here. Validate changes by
  careful reading (syntax, object-bound scope, platform-constraint compliance) and by cross-
  checking against working patterns elsewhere in this repo. Never claim a script "works" or
  "passes tests" — state explicitly that it still needs manual verification in the Backend Plot
  Editor.
- **Debugging:** because state is object-bound, always establish which object a script is attached
  to and what triggers it (`OnClick`, `TriggerEnter`, always-on `None`, `None_DoOnce`, etc.) before
  proposing a fix — identical code can misbehave purely from wrong trigger/object placement, not
  faulty logic.
- **Documentation:** `CustomCommands.md` is the single source of truth for command signatures.
  When you learn about a new or changed command, update it there rather than forking a second,
  competing reference; only mirror a short summary here if it's broad enough to matter for every
  session.
- **Existing example files:** treat the root `.ms` files as a read-only pattern library (see
  "Repository Structure" above) unless the user explicitly asks for cleanup or reorganization.
