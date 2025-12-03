# Tactic Dev Repository Standards

This document defines the standards and requirements for all repositories in the Tactic Dev organization. Following these standards ensures consistency, quality, and maintainability across all projects.

## 📋 Table of Contents

- [Required Documentation](#required-documentation)
- [Repository Configuration](#repository-configuration)
- [Branch Protection](#branch-protection)
- [File Organization](#file-organization)
- [Metadata and Settings](#metadata-and-settings)
- [Security Requirements](#security-requirements)
- [CI/CD Standards](#cicd-standards)
- [New Repository Checklist](#new-repository-checklist)

## 📄 Required Documentation

Every repository must include the following documentation files:

### 1. README.md

**Location**: Root directory  
**Status**: **REQUIRED**

The README is the entry point for anyone discovering your project. It must include:

- **Project Title and Logo** (if applicable)
- **Badges** (build status, version, license, etc.)
- **Brief Description** - What does this project do?
- **Table of Contents** - For longer READMEs
- **Features** - Key capabilities
- **Installation/Setup Instructions** - How to get started
- **Usage Examples** - How to use the project
- **API Documentation** or link to docs
- **Contributing** - Link to CONTRIBUTING.md
- **License** - License type and link to LICENSE
- **Contact/Community** - Links to discussions, issues
- **Acknowledgments** - Credits and recognition

**Template Available**: See `.github` repository for examples

### 2. LICENSE

**Location**: Root directory  
**Status**: **REQUIRED**

- Use MIT License for open-source projects (default)
- Include full license text
- Update copyright year and holder
- See [choosealicense.com](https://choosealicense.com/) for alternatives

### 3. CONTRIBUTING.md

**Location**: Root directory or `.github/` directory  
**Status**: **REQUIRED**

Must include:

- How to report bugs
- How to suggest features
- Development setup instructions
- Code style guidelines
- Commit message conventions
- Pull request process
- Testing requirements
- Community guidelines reference

**Standard Available**: Use the organization-wide CONTRIBUTING.md from `.github` repo

### 4. CODE_OF_CONDUCT.md

**Location**: Root directory or `.github/` directory  
**Status**: **REQUIRED**

- Use Contributor Covenant 2.1 (standard)
- Include enforcement process
- Add Tactic Dev specific values
- Reference reporting mechanisms

**Standard Available**: Use the organization-wide CODE_OF_CONDUCT.md from `.github` repo

### 5. SECURITY.md

**Location**: Root directory or `.github/` directory  
**Status**: **REQUIRED**

Must include:

- Supported versions
- How to report vulnerabilities
- Security update process
- Expected response timeline
- Scope (what's in/out of scope)
- Security best practices for contributors

**Standard Available**: Use the organization-wide SECURITY.md from `.github` repo

### 6. CHANGELOG.md

**Location**: Root directory  
**Status**: **RECOMMENDED**

- Follow [Keep a Changelog](https://keepachangelog.com/) format
- Document all notable changes
- Group changes by type (Added, Changed, Fixed, etc.)
- Include version numbers and dates
- Link to releases

### 7. .gitignore

**Location**: Root directory  
**Status**: **REQUIRED**

- Include language-specific ignores
- Ignore build artifacts
- Ignore dependency directories
- Ignore IDE/editor files
- Never commit secrets or credentials

**Templates**: Use GitHub's [gitignore templates](https://github.com/github/gitignore)

## 🔧 Repository Configuration

### Issue Templates

**Location**: `.github/ISSUE_TEMPLATE/`  
**Status**: **REQUIRED**

Minimum templates required:

1. **bug_report.yml** - For bug reports
2. **feature_request.yml** - For feature suggestions
3. **documentation.yml** - For documentation improvements
4. **question.yml** - For general questions
5. **config.yml** - Issue template configuration

**Standard Available**: Use templates from `.github` repository

### Pull Request Template

**Location**: `.github/PULL_REQUEST_TEMPLATE.md`  
**Status**: **REQUIRED**

Must include:

- Description field
- Type of change checkboxes
- Testing checklist
- Code quality checklist
- Security considerations
- Documentation updates

**Standard Available**: Use template from `.github` repository

### GitHub Actions Workflows

**Location**: `.github/workflows/`  
**Status**: **RECOMMENDED**

Standard workflows:

1. **CI** - Build and test on PR and push
2. **Lint** - Code style checking
3. **Security** - Dependency scanning
4. **Release** - Automated releases (if applicable)

**Templates Available**: See `workflow-templates/` in `.github` repository

## 🛡️ Branch Protection

### Main Branch Protection

**Status**: **REQUIRED**

All repositories must enable branch protection for the `main` branch with these rules:

#### Minimum Requirements (Solo Projects)

- ✅ Require pull request before merging (0 approvals)
- ✅ Require status checks to pass
- ✅ Block force pushes
- ✅ Allow admin bypass for emergencies

#### Standard Requirements (Team Projects)

- ✅ Require pull request before merging
  - Required approvals: 1
  - Dismiss stale reviews on new commits
- ✅ Require status checks to pass
  - Require branches to be up to date
  - Required checks: build, lint, test
- ✅ Block force pushes
- ✅ Block deletions
- ✅ Allow admin bypass for emergencies

#### Strict Requirements (Production Code)

- ✅ Require pull request before merging
  - Required approvals: 2
  - Require code owner review
  - Dismiss stale reviews on new commits
- ✅ Require status checks to pass
  - Require branches to be up to date
  - All CI checks must pass
- ✅ Require signed commits
- ✅ Require linear history
- ✅ Block force pushes
- ✅ Block deletions
- ✅ Limit who can push (specific teams only)

**Setup Guide**: See `branch-protection-rules.md` in `.github` repository

### Branch Naming Convention

Use descriptive branch names:

- `feature/<description>` - New features
- `fix/<description>` - Bug fixes
- `docs/<description>` - Documentation
- `refactor/<description>` - Code refactoring
- `test/<description>` - Test additions
- `chore/<description>` - Maintenance tasks

## 📁 File Organization

### Directory Structure

Standard directory organization:

```
repository/
├── .github/              # GitHub specific files
│   ├── ISSUE_TEMPLATE/   # Issue templates
│   ├── workflows/        # GitHub Actions
│   └── PULL_REQUEST_TEMPLATE.md
├── docs/                 # Extended documentation
├── src/                  # Source code (or equivalent)
├── tests/                # Test files
├── examples/             # Usage examples (if applicable)
├── .gitignore
├── CHANGELOG.md
├── CODE_OF_CONDUCT.md
├── CONTRIBUTING.md
├── LICENSE
├── README.md
├── SECURITY.md
└── (language-specific files)
```

### Documentation Organization

- **README.md** - Quick start and overview
- **docs/** - Detailed documentation
  - `docs/getting-started.md` - Installation and setup
  - `docs/api.md` - API reference
  - `docs/architecture.md` - System design
  - `docs/contributing.md` - Detailed contribution guide

## 🏷️ Metadata and Settings

### Repository Description

**Status**: **REQUIRED**

- Write clear, concise description (max 350 characters)
- Describe what the project does, not what it uses
- Include key features or differentiators
- Use sentence case

**Examples**:
- ✅ "An experimental, AI-powered programming language designed for declarative automation"
- ❌ "Python code"

### Topics/Tags

**Status**: **REQUIRED**

Add relevant topics for discoverability:

- Language (e.g., `python`, `rust`, `javascript`)
- Framework (e.g., `react`, `django`, `tokio`)
- Purpose (e.g., `automation`, `cli`, `web`)
- Category (e.g., `ai`, `security`, `development-tools`)

**Minimum**: 3-5 relevant topics

### Website URL

**Status**: **RECOMMENDED**

- Link to project website if available
- Link to documentation site
- Link to demo/playground
- Or link to main organization site

### Social Preview

**Status**: **RECOMMENDED**

- Upload custom social preview image
- Dimensions: 1280x640 pixels
- Include project name and logo
- Use brand colors

### About Section

**Status**: **REQUIRED**

Fill out all applicable fields:

- ✅ Description
- ✅ Website
- ✅ Topics
- ☐ Releases
- ☐ Packages
- ☐ Discussions (if enabled)

## 🔒 Security Requirements

### Secret Management

- **NEVER** commit secrets, API keys, or passwords
- Use `.env` files (add to `.gitignore`)
- Provide `.env.example` template
- Use GitHub Secrets for CI/CD
- Document required environment variables

### Dependency Management

- Keep dependencies up to date
- Enable Dependabot alerts
- Enable Dependabot security updates
- Review dependency changes carefully
- Pin versions in production

### Security Scanning

Enable GitHub security features:

- ✅ Dependabot alerts
- ✅ Dependabot security updates
- ✅ Secret scanning
- ✅ Code scanning (CodeQL) - if applicable

### Vulnerability Disclosure

- Follow SECURITY.md guidelines
- Use GitHub Security Advisories
- Coordinate disclosure timing
- Credit security researchers

## 🔄 CI/CD Standards

### Continuous Integration

**Status**: **REQUIRED for code repositories**

Minimum CI requirements:

- ✅ Run on every pull request
- ✅ Run on push to main
- ✅ Build the project
- ✅ Run all tests
- ✅ Run linter
- ✅ Check code formatting
- ✅ Report coverage (if applicable)

### Testing Requirements

- Write tests for new features
- Maintain test coverage above 70% (recommended)
- Include unit tests
- Include integration tests (if applicable)
- Test edge cases and error conditions

### Code Quality

- Use linter for code style
- Use formatter for consistency
- Fix all linter warnings
- Keep code DRY (Don't Repeat Yourself)
- Write self-documenting code

## ✅ New Repository Checklist

Use this checklist when creating a new repository:

### Initial Setup

- [ ] Create repository with descriptive name
- [ ] Add repository description
- [ ] Add topics/tags (minimum 3)
- [ ] Set repository visibility (public/private)
- [ ] Initialize with README
- [ ] Choose appropriate license (MIT default)

### Documentation

- [ ] Write comprehensive README.md
- [ ] Add LICENSE file
- [ ] Add CONTRIBUTING.md (use org default or customize)
- [ ] Add CODE_OF_CONDUCT.md (use org default)
- [ ] Add SECURITY.md (use org default or customize)
- [ ] Create CHANGELOG.md (if versioned project)
- [ ] Add .gitignore (language-appropriate)

### Issue and PR Templates

- [ ] Add bug report template
- [ ] Add feature request template
- [ ] Add documentation template
- [ ] Add question template
- [ ] Configure issue template settings
- [ ] Add pull request template

### Branch Protection

- [ ] Enable branch protection for main
- [ ] Require pull requests
- [ ] Require status checks (if CI exists)
- [ ] Block force pushes
- [ ] Block branch deletion
- [ ] Configure bypass rules

### CI/CD

- [ ] Set up GitHub Actions workflow
- [ ] Configure build pipeline
- [ ] Configure test pipeline
- [ ] Configure linting
- [ ] Add status badges to README

### Security

- [ ] Enable Dependabot alerts
- [ ] Enable Dependabot security updates
- [ ] Enable secret scanning
- [ ] Enable code scanning (if applicable)
- [ ] Review security settings

### Metadata

- [ ] Set website URL
- [ ] Upload social preview image
- [ ] Configure repository features
  - [ ] Issues enabled
  - [ ] Projects (if needed)
  - [ ] Wiki (if needed)
  - [ ] Discussions (if needed)

### Final Review

- [ ] Test repository setup with a PR
- [ ] Verify all links work
- [ ] Verify CI/CD runs successfully
- [ ] Review security settings
- [ ] Share with team for feedback

## 📊 Repository Audit

Conduct regular audits to ensure compliance:

### Monthly Review

- Check for outdated dependencies
- Review open issues and PRs
- Update documentation if needed
- Check CI/CD status
- Review security alerts

### Quarterly Review

- Review and update CONTRIBUTING.md
- Review and update SECURITY.md
- Update CHANGELOG.md
- Review branch protection rules
- Audit access permissions
- Update repository description/topics if needed

### Annual Review

- Review and update LICENSE (copyright year)
- Comprehensive documentation review
- Review all policies and guidelines
- Update social preview image if needed
- Review repository structure

## 🛠️ Tools and Automation

### Recommended Tools

- **Documentation**: MkDocs, Docusaurus, GitBook
- **Linting**: ESLint, Pylint, Clippy (Rust)
- **Formatting**: Prettier, Black, rustfmt
- **Testing**: Jest, pytest, cargo test
- **Coverage**: Codecov, Coveralls
- **Security**: Snyk, OWASP Dependency-Check

### Automation Scripts

Consider creating scripts for:

- New repository setup
- Dependency updates
- Documentation generation
- Release automation
- Security scanning

## 📚 Resources

### Official Documentation

- [GitHub Docs](https://docs.github.com/)
- [GitHub Actions](https://docs.github.com/en/actions)
- [Branch Protection](https://docs.github.com/en/repositories/configuring-branches-and-merges-in-your-repository/managing-protected-branches)
- [Security Advisories](https://docs.github.com/en/code-security/security-advisories)

### Community Standards

- [Contributor Covenant](https://www.contributor-covenant.org/)
- [Keep a Changelog](https://keepachangelog.com/)
- [Semantic Versioning](https://semver.org/)
- [Conventional Commits](https://www.conventionalcommits.org/)

### Tactic Dev Resources

- [Organization Profile](https://github.com/Tactic-Dev)
- [.github Repository](https://github.com/Tactic-Dev/.github)
- [GitHub Discussions](https://github.com/orgs/Tactic-Dev/discussions)
- [Tactic Dev Website](https://tacticdev.com)

## 🤝 Getting Help

If you need help implementing these standards:

1. Check the `.github` repository for templates and examples
2. Review `branch-protection-rules.md` for branch protection setup
3. Ask in [GitHub Discussions](https://github.com/orgs/Tactic-Dev/discussions)
4. Open an issue in the `.github` repository

## 📝 Updates and Feedback

This document is maintained in the `.github` repository. Suggest improvements by:

- Opening an issue
- Starting a discussion
- Submitting a pull request

**Last Updated**: December 3, 2025  
**Version**: 1.0

---

> *"Quality is not an act, it is a habit."*  
> — **Aristotle**

**Maintained by** [Tactic Dev](https://tacticdev.com)
