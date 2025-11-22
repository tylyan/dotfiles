# Commit Command

Analyze the current git changes and generate a commit message following the Conventional Commits specification (https://www.conventionalcommits.org/en/v1.0.0/).

## Instructions

1. **Analyze Changes**: Review git status and git diff to understand all staged and unstaged changes
2. **Determine Type**: Select the appropriate commit type based on the changes:
   - `feat:` - New feature or functionality
   - `fix:` - Bug fix
   - `refactor:` - Code refactoring without changing functionality
   - `perf:` - Performance improvement
   - `docs:` - Documentation changes only
   - `style:` - Code style changes (formatting, missing semicolons, etc.)
   - `test:` - Adding or updating tests
   - `build:` - Changes to build system or dependencies
   - `ci:` - CI/CD configuration changes
   - `chore:` - Other changes that don't modify src or test files

3. **Add Scope** (optional): Include scope in parentheses if changes are isolated to a specific module/area
   - Examples: `feat(auth):`, `fix(database):`, `refactor(ipc):`

4. **Breaking Changes**: Add `!` after type/scope if there are breaking changes
   - Example: `feat(api)!:` or `feat!:`

5. **Write Description**: Create a concise, imperative mood description (50-72 chars)
   - Use present tense: "add feature" not "added feature"
   - Don't capitalize first letter
   - No period at the end
   - Be specific and descriptive

6. **Write Body**: Add a detailed body explaining:
   - **What** changed and **why** (not how - code shows that)
   - Context and motivation for the change
   - Any important implementation details
   - Use bullet points for multiple changes
   - Wrap at 72 characters per line
   - Separate from description with blank line

7. **Add Footers** (if applicable):
   - `BREAKING CHANGE:` description of breaking changes
   - `Fixes #123` or `Closes #123` for issue references
   - `Refs #123` for related issues

## Format

```
<type>[optional scope]: <description>

[optional body]

[optional footer(s)]
```

## Examples

### Simple feature
```
feat(gmail): add oauth2 authentication flow

Implement Gmail OAuth2 authentication using Google's official client library.
Users can now connect their Gmail accounts securely through the settings panel.
```

### Bug fix with scope
```
fix(database): resolve thread sorting issue

Threads were not sorting correctly by last message date. Updated the SQL
query to use MAX(emails.received_at) in the ORDER BY clause.

Fixes #42
```

### Breaking change
```
feat(ipc)!: redesign IPC channel type system

Replace string-based channel names with type-safe channel definitions.
This provides better autocomplete and compile-time type checking for IPC calls.

BREAKING CHANGE: All IPC channel names must now be imported from types/ipc.ts
instead of using string literals. Update all window.api calls to use the new
typed channel constants.
```

### Multiple changes (refactor)
```
refactor(services): consolidate database service classes

- Merge EmailService and ThreadService into unified DatabaseService
- Extract common CRUD patterns into base service class
- Add transaction support for multi-table operations
- Improve error handling with custom DatabaseError types
```

## Output

Present the generated commit message in a code block so it can be easily copied. Then ask if the user would like to:
1. Proceed with creating the commit
2. Modify the message
3. Add more changes before committing
