# Contributing to Mottainai

Thanks for taking the time to contribute! This repository holds the organization-wide
community health files and shared development standards for the Mottainai ecosystem.

By following these guidelines you help keep the project maintainable, reviewable,
and consistent across every repository in the organization.

## Table of Contents

- [Code of Conduct](#code-of-conduct)
- [Getting Started](#getting-started)
- [Branching Model](#branching-model)
- [Commit Conventions](#commit-conventions)
- [Opening a Pull Request](#opening-a-pull-request)
- [AI Review](#ai-review)
- [Questions](#questions)

## Code of Conduct

Please read and follow our [Code of Conduct](./CODE_OF_CONDUCT.md) in all your
interactions with the project. Be respectful, constructive, and inclusive.

## Getting Started

1. Fork the repository (for external contributors) or clone it directly (for
   organization members).
2. Create a branch off the `develop` branch using a descriptive name, for example
   `feature/issue-tracker`, `fix/typo-in-readme`, or `docs/api-examples`.
3. Make your changes, keeping them focused on a single concern.

## Branching Model

- `main` is the stable, production-ready branch. It is protected.
- `develop` is the integration branch. **Always branch off `develop` and target
  it with your pull requests.**
- Feature branches follow the pattern `feature/<short-description>`.
- Bug fix branches follow the pattern `fix/<short-description>`.
- Documentation branches follow the pattern `docs/<short-description>`.

## Commit Conventions

Commits should be written in English and follow the
[Conventional Commits](https://www.conventionalcommits.org/) specification:

```
<type>(<scope>): <subject>
```

Common types:

- `feat`: a new feature
- `fix`: a bug fix
- `docs`: documentation only changes
- `chore`: maintenance tasks
- `refactor`: code changes that neither fix a bug nor add a feature
- `test`: adding or updating tests

Keep the subject line under 72 characters, use the imperative mood, and do not
end it with a period. Example:

```
feat(health): add org-level support template
```

## Opening a Pull Request

1. Commit your changes following the conventions above.
2. Push your branch and open a pull request against `develop`.
3. Use the pull request template and fill in the sections.
4. Keep the scope of the PR small so it is easy to review.
5. Once opened, a bot will automatically run an AI review and may apply labels
   such as `ai-review:approved` or `ai-review:changes-requested`.

## AI Review

The organization uses an automated AI review bot. After you open a pull request:

- The bot analyzes the diff and posts a review comment.
- It applies relevant labels (for example `type:feature`, `type:docs`) and an
  AI review status label.
- Address any suggestions before requesting human reviewers.

## Questions

If you have questions about contributing, open an issue in this repository or
reach out to the maintainers.
