## Pull Request Checklist

Please check if your pull request meets the following requirements:

- [ ] All public facing functions have documentation comments (double hashtag -- not single -- above each function declaration)
- [ ] Pull request commit header uses the template: `<type>([scope]): <short summary>`
  - Types: `build` | `chore` | `ci` | `docs` | `feat` | `fix` | `perf` | `refactor` | `test`
- [ ] **Don't even bother if it's a vibe coded pull request.**

### Pull Request Type

It must be one of the following types:

- **build**: Changes that affect the build system or updates to external dependencies.
- **chore**: Minor changes that do not modify `/src`.
- **ci**: Changes to Github Actions related files and scripts.
- **docs**: Documentation only changes.
- **feat**: Addition of a new feature.
- **fix**: Bug fixes.
- **perf**: Code changes that improve runtime performance.
- **refactor**: Changes intended to improve readability and maintainability of codebase.
- **test**: Narrowing of existing specifications or otherwise definition of.

### Scope

As a simple guide, use `/src/cases` to define the scope. It is assumed to be in `snake_case`.

## Pull Request Information

Declare any information that you deem essential for other contributors to know.
