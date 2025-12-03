# Contributing to Tactic Dev Projects

First off, thank you for considering contributing to our projects! 🎉

Tactic Dev builds scalable systems at the intersection of AI, automation, and web development. We welcome contributions from the community and are grateful for your interest in improving our work.

## 📋 Table of Contents

- [Code of Conduct](#code-of-conduct)
- [How Can I Contribute?](#how-can-i-contribute)
- [Getting Started](#getting-started)
- [Development Workflow](#development-workflow)
- [Coding Standards](#coding-standards)
- [Commit Guidelines](#commit-guidelines)
- [Pull Request Process](#pull-request-process)
- [Issue Guidelines](#issue-guidelines)
- [Community](#community)

## 📜 Code of Conduct

This project and everyone participating in it is governed by our [Code of Conduct](CODE_OF_CONDUCT.md). By participating, you are expected to uphold this code. Please report unacceptable behavior to the project maintainers.

## 🤝 How Can I Contribute?

### Reporting Bugs

Before creating bug reports, please check the existing issues to avoid duplicates. When you create a bug report, include as many details as possible:

- **Use a clear and descriptive title**
- **Describe the exact steps to reproduce the problem**
- **Provide specific examples to demonstrate the steps**
- **Describe the behavior you observed and what you expected**
- **Include screenshots or animated GIFs if applicable**
- **Include your environment details** (OS, version, etc.)

### Suggesting Enhancements

Enhancement suggestions are tracked as GitHub issues. When creating an enhancement suggestion:

- **Use a clear and descriptive title**
- **Provide a detailed description of the proposed enhancement**
- **Explain why this enhancement would be useful**
- **Include examples of how the feature would be used**
- **List any alternatives you've considered**

### Contributing Code

We love receiving pull requests! Here's how you can contribute:

1. **Fork the repository** and create your branch from `main`
2. **Make your changes** following our coding standards
3. **Test your changes** thoroughly
4. **Update documentation** as needed
5. **Submit a pull request** with a clear description

## 🚀 Getting Started

### Prerequisites

Each project may have specific prerequisites. Generally, you'll need:

- Git for version control
- Appropriate runtime environment (Python, Node.js, Rust, etc.)
- Project-specific dependencies listed in the repository

### Setting Up Your Development Environment

1. **Fork and Clone**
   ```bash
   git clone https://github.com/YOUR-USERNAME/REPO-NAME.git
   cd REPO-NAME
   ```

2. **Create a Branch**
   ```bash
   git checkout -b feature/your-feature-name
   # or
   git checkout -b fix/your-bug-fix
   ```

3. **Install Dependencies**
   ```bash
   # For Python projects
   python -m venv .venv
   source .venv/bin/activate  # On Windows: .venv\Scripts\activate
   pip install -r requirements.txt
   pip install -r requirements-dev.txt  # If available

   # For Node.js projects
   npm install

   # For Rust projects
   cargo build
   ```

## 🔄 Development Workflow

### Branch Naming Convention

Use descriptive branch names that indicate the purpose:

- `feature/add-new-capability` - New features
- `fix/resolve-bug-description` - Bug fixes
- `docs/update-readme` - Documentation updates
- `refactor/improve-code-structure` - Code refactoring
- `test/add-unit-tests` - Test additions

### Testing

Always test your changes before submitting:

```bash
# Python projects
pytest

# Node.js projects
npm test

# Rust projects
cargo test
```

### Linting and Formatting

Ensure your code follows the project's style guidelines:

```bash
# Python projects
black .
flake8
pylint

# Node.js projects
npm run lint
npm run format

# Rust projects
cargo fmt
cargo clippy
```

## 📝 Coding Standards

### General Principles

- **Write clear, readable code** - Code is read more often than written
- **Keep it simple** - Avoid unnecessary complexity
- **Be consistent** - Follow existing patterns in the codebase
- **Comment wisely** - Explain "why", not "what"
- **Write tests** - Ensure your code is testable and tested

### Language-Specific Standards

#### Python
- Follow [PEP 8](https://pep8.org/) style guide
- Use type hints where appropriate
- Write docstrings for classes and functions
- Prefer descriptive variable names

#### JavaScript/TypeScript
- Follow [Airbnb JavaScript Style Guide](https://github.com/airbnb/javascript)
- Use meaningful variable and function names
- Prefer `const` over `let`, avoid `var`
- Use async/await over promises when possible

#### Rust
- Follow [Rust API Guidelines](https://rust-lang.github.io/api-guidelines/)
- Use `cargo fmt` for formatting
- Write comprehensive documentation comments
- Handle errors explicitly

## 💬 Commit Guidelines

### Commit Message Format

Write clear, meaningful commit messages:

```
<type>(<scope>): <subject>

<body>

<footer>
```

**Types:**
- `feat`: New feature
- `fix`: Bug fix
- `docs`: Documentation changes
- `style`: Code style changes (formatting, missing semicolons, etc.)
- `refactor`: Code refactoring
- `test`: Adding or updating tests
- `chore`: Maintenance tasks

**Example:**
```
feat(auth): add OAuth2 authentication support

Implement OAuth2 authentication flow using industry-standard libraries.
Includes token refresh mechanism and secure credential storage.

Closes #123
```

### Commit Best Practices

- Keep commits atomic and focused
- Write descriptive commit messages
- Reference issues and pull requests when relevant
- Avoid committing unrelated changes together

## 🔀 Pull Request Process

### Before Submitting

1. **Update your branch** with the latest `main`
   ```bash
   git fetch origin
   git rebase origin/main
   ```

2. **Test thoroughly** - Ensure all tests pass
3. **Update documentation** - If your changes affect usage
4. **Review your own changes** - Look through the diff

### PR Description Template

```markdown
## Description
Brief description of the changes

## Type of Change
- [ ] Bug fix
- [ ] New feature
- [ ] Breaking change
- [ ] Documentation update

## Testing
Describe how you tested your changes

## Checklist
- [ ] My code follows the project's style guidelines
- [ ] I have performed a self-review of my code
- [ ] I have commented my code, particularly in hard-to-understand areas
- [ ] I have updated the documentation accordingly
- [ ] My changes generate no new warnings
- [ ] I have added tests that prove my fix is effective or that my feature works
- [ ] New and existing unit tests pass locally with my changes
```

### Review Process

1. **Automated checks** must pass (CI/CD, linting, tests)
2. **Code review** by at least one maintainer
3. **Address feedback** by pushing new commits or amending
4. **Approval** required before merge

### After Your PR is Merged

- Delete your feature branch
- Pull the latest `main` branch
- Celebrate! 🎉

## 📋 Issue Guidelines

### Creating Issues

Use the appropriate issue template:

- **Bug Report** - For reporting bugs
- **Feature Request** - For suggesting new features
- **Documentation** - For documentation improvements
- **Question** - For asking questions

### Issue Labels

We use labels to categorize issues:

- `bug` - Something isn't working
- `enhancement` - New feature or request
- `documentation` - Documentation improvements
- `good first issue` - Good for newcomers
- `help wanted` - Extra attention is needed
- `priority: high` - High priority issues
- `priority: low` - Low priority issues

## 🌐 Community

### Communication Channels

- **GitHub Discussions** - [Tactic Dev Discussions](https://github.com/orgs/Tactic-Dev/discussions)
- **GitHub Issues** - For bug reports and feature requests
- **Pull Requests** - For code contributions

### Getting Help

If you need help:

1. Check the project's README and documentation
2. Search existing issues and discussions
3. Ask in GitHub Discussions
4. Open a new issue if you've found a bug

### Recognition

We value all contributions! Contributors will be:

- Listed in the project's contributors
- Mentioned in release notes for significant contributions
- Recognized in the community

## 📚 Additional Resources

- [GitHub Flow](https://guides.github.com/introduction/flow/)
- [Conventional Commits](https://www.conventionalcommits.org/)
- [Semantic Versioning](https://semver.org/)

## 🙏 Thank You!

Your contributions make Tactic Dev projects better. We appreciate your time and effort in helping us build amazing tools and systems!

---

> *"Automation isn't about replacing creativity — it's about removing friction."*  
> — **Tyler Hill**, Principal Developer @ [Tactic Dev](https://tacticdev.com)
