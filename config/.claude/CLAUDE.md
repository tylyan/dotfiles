CLAUDE.md – Global Software Development Best Practices

🧭 Purpose

This document defines best practices for contributing, reviewing, and maintaining software projects across all tech stacks.
It is designed for human and AI contributors (e.g., Claude) to ensure consistency, quality, and maintainability across the SDLC.

⸻

1️⃣ Software Development Lifecycle (SDLC) Principles
	1.	Requirements & Planning
	•	Understand business objectives and acceptance criteria.
	•	Write clear, measurable, and testable requirements.
	•	Estimate complexity and dependencies.
	2.	Design & Architecture
	•	Favor modular, decoupled, and reusable components.
	•	Follow SOLID principles where applicable.
	•	Document architecture decisions in a lightweight ADR (Architecture Decision Record).
	•	Consider performance, scalability, and maintainability from the start.
	3.	Implementation / Coding
	•	Write clean, readable, and self-explanatory code.
	•	Adhere to language-specific conventions and coding standards.
	•	DRY (Don’t Repeat Yourself) and KISS (Keep It Simple, Stupid).
	•	Include inline documentation or docstrings for complex logic.
	•	Use version control with meaningful commits.
	4.	Testing & Validation
	•	Implement unit, integration, and end-to-end tests where appropriate.
	•	Aim for high coverage on critical modules.
	•	Write tests that are deterministic and independent.
	•	Use automated testing pipelines for CI/CD.
	5.	Code Review & Collaboration
	•	Reviews focus on readability, correctness, and maintainability.
	•	Provide constructive feedback; avoid nitpicks unless they affect clarity or standards.
	•	Document discussion outcomes in PR comments or issues.
	•	Ensure peer knowledge transfer through reviews and documentation.
	6.	Deployment & Monitoring
	•	Follow automated CI/CD pipelines for builds and deployments.
	•	Include logging and monitoring to detect and diagnose issues.
	•	Rollback mechanisms should be tested and documented.
	•	Continuously monitor for performance, errors, and user impact.
	7.	Maintenance & Refactoring
	•	Refactor for clarity, performance, and maintainability periodically.
	•	Update dependencies safely, with tests to validate changes.
	•	Document any breaking changes or migration steps.
	•	Archive or remove unused code and assets.

⸻

2️⃣ Git & Version Control
	•	Use feature branches for work; avoid committing directly to main.
	•	Commit messages should be clear and structured (e.g., Conventional Commits):

<type>(<scope>): <description>
feat(auth): add password reset flow
fix(ui): correct modal stacking
refactor(api): simplify error handling

	•	Merge only reviewed and tested code.
	•	Tag releases semantically (vMAJOR.MINOR.PATCH).

⸻

3️⃣ Code Quality & Best Practices
	•	Readability: Prioritize clarity over cleverness.
	•	Consistency: Follow project coding conventions (indentation, naming, formatting).
	•	Error Handling: Always handle edge cases and failures gracefully.
	•	Documentation: Update READMEs, comments, and ADRs.
	•	Security: Validate input, handle sensitive data securely, and follow security best practices.

⸻

4️⃣ Testing & Quality Assurance
	•	Automate testing where possible.
	•	Test critical paths for functionality, performance, and security.
	•	Continuous Integration (CI) should catch linting, formatting, and test failures.
	•	Regression prevention: Add tests for every bug fix.

⸻

5️⃣ AI Contribution Guidelines

When AI is assisting in coding or documentation:
	1.	Follow existing patterns in code or architecture.
	2.	Document reasoning behind generated solutions.
	3.	Check outputs for correctness, security, and performance.
	4.	Avoid introducing duplicate logic or anti-patterns.
	5.	Include tests or examples if new functionality is introduced.

⸻

6️⃣ Pull Request & Collaboration Checklist

Before merging:
	•	Code compiles/builds successfully
	•	Linting & formatting pass
	•	Tests pass and new tests added if applicable
	•	No unused variables or dead code
	•	Documentation updated if functionality changed
	•	PR description clearly explains what changed and why

⸻

7️⃣ Communication & Documentation
	•	Use issues, boards, and discussions to track tasks and ideas.
	•	Keep docs updated with API, architecture, and design decisions.
	•	Use clear language, avoiding jargon when possible.
	•	Document trade-offs and decisions in ADRs.

⸻

8️⃣ Continuous Learning & Improvement
	•	Conduct post-mortems for production issues.
	•	Refactor regularly to reduce technical debt.
	•	Share lessons learned with the team.
	•	Keep knowledge centralized in accessible docs.
