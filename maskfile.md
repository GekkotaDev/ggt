# Development Environment Tasks

This assumes that `mask` has been installed. If it hasn't already been
installed one may use `mise` en place.

## sync

> Synchronize project dependencies

By synchronizing project dependencies this ensures that the pinned versions are
used and that they exist in the first place.

```nu
mise i
pnpm i
uv sync

cd src

ggg sync
```

## commit

> Create a commit following the Conventional Commits specification

```nu
$env.HUSKY = 1

let isWindows = (sys host).name | str downcase | $in == "windows"

if ($isWindows) {
    print "Dry run only on Windows";
    pnpm better-commits --dry-run
} else {
    pnpm better-commits
}

```

## dev

```nu
cd src
ggg edit
```
