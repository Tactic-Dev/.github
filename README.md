# .github - Tactic Dev Organization Configuration

This special `.github` repository contains organization-wide documentation, templates, and configurations for all Tactic Dev repositories.

[![Organization](https://img.shields.io/badge/Organization-Tactic--Dev-181717?style=flat-square&logo=github)](https://github.com/Tactic-Dev)
[![Website](https://img.shields.io/badge/Website-tacticdev.com-256EFF?style=flat-square)](https://tacticdev.com)
[![Discussions](https://img.shields.io/badge/Discussions-Join%20Us-181717?style=flat-square&logo=github)](https://github.com/orgs/Tactic-Dev/discussions)

---

## 📋 What's in This Repository

### 📄 Organization-Wide Default Files

These files automatically apply to **all repositories** in the Tactic-Dev organization that don't have their own versions:

- **[CONTRIBUTING.md](CONTRIBUTING.md)** - How to contribute to our projects
- **[CODE_OF_CONDUCT.md](CODE_OF_CONDUCT.md)** - Community standards and behavior expectations
- **[SECURITY.md](SECURITY.md)** - Security policy and vulnerability reporting
- **[SUPPORT.md](SUPPORT.md)** - How to get help and support

### 🎨 Templates

Ready-to-use templates for consistent project management:

- **Issue Templates** ([`.github/ISSUE_TEMPLATE/`](.github/ISSUE_TEMPLATE/))
  - Bug reports
  - Feature requests
  - Documentation improvements
  - General questions
- **Pull Request Template** ([`.github/PULL_REQUEST_TEMPLATE.md`](.github/PULL_REQUEST_TEMPLATE.md))
- **Workflow Templates** ([`workflow-templates/`](workflow-templates/))
  - CI/CD workflows
  - Automated testing
  - Linting and formatting

### 📚 Documentation Standards

Comprehensive guides for repository setup and maintenance:

- **[REPOSITORY_STANDARDS.md](REPOSITORY_STANDARDS.md)** - Complete documentation requirements and standards
- **[RULESET_CONFIGURATION.md](RULESET_CONFIGURATION.md)** - Branch protection and ruleset setup guide
- **[IMPLEMENTATION_GUIDE.md](IMPLEMENTATION_GUIDE.md)** - Step-by-step repository setup guide
- **[branch-protection-rules.md](branch-protection-rules.md)** - Branch protection overview

### 🛡️ Repository Rulesets

Pre-configured branch protection rulesets ([`rulesets/`](rulesets/)):

- **Tier 1**: Solo Development (minimal protection)
- **Tier 2**: Standard Team (recommended for most projects)
- **Tier 3**: Critical/Production (maximum security)

### 🤖 Automation Scripts

Tools to streamline repository management ([`scripts/`](scripts/)):

- **`apply-rulesets.sh`** - Apply branch protection across repositories
- **`audit-repos.sh`** - Audit documentation and configuration
- See [scripts/README.md](scripts/README.md) for complete documentation

### 🎭 Organization Profile

Public-facing organization profile ([`profile/`](profile/)):

- **[profile/README.md](profile/README.md)** - Organization profile displayed on GitHub

---

## 🚀 Quick Start

### For New Repositories

Creating a new repository in Tactic-Dev? Follow our [Implementation Guide](IMPLEMENTATION_GUIDE.md):

1. Create repository on GitHub
2. Add metadata (description, topics)
3. Repository automatically inherits organization defaults
4. Apply branch protection ruleset
5. Enable security features
6. Start coding!

**Quick command:**
```bash
# Clone this repo
git clone https://github.com/Tactic-Dev/.github.git
cd .github/scripts

# Apply tier2 ruleset to your new repo
./apply-rulesets.sh tier2 your-repo-name
```

### For Existing Repositories

Want to bring an existing repository up to standards?

1. Review [REPOSITORY_STANDARDS.md](REPOSITORY_STANDARDS.md)
2. Run the audit script:
   ```bash
   cd scripts
   ./audit-repos.sh my-audit.md
   ```
3. Add missing documentation
4. Apply branch protection
5. Enable security features

### For Contributors

Contributing to a Tactic-Dev project?

1. Read [CONTRIBUTING.md](CONTRIBUTING.md)
2. Review [CODE_OF_CONDUCT.md](CODE_OF_CONDUCT.md)
3. Check project-specific documentation
4. Open an issue or PR!

---

## 📖 Documentation Overview

| Document | Purpose | Audience |
|----------|---------|----------|
| [REPOSITORY_STANDARDS.md](REPOSITORY_STANDARDS.md) | Complete standards and requirements | Repository owners, maintainers |
| [IMPLEMENTATION_GUIDE.md](IMPLEMENTATION_GUIDE.md) | Step-by-step setup instructions | New repository creators |
| [RULESET_CONFIGURATION.md](RULESET_CONFIGURATION.md) | Branch protection setup | DevOps, repository admins |
| [CONTRIBUTING.md](CONTRIBUTING.md) | How to contribute | Contributors, developers |
| [CODE_OF_CONDUCT.md](CODE_OF_CONDUCT.md) | Community standards | Everyone |
| [SECURITY.md](SECURITY.md) | Security policy | Security researchers, users |
| [SUPPORT.md](SUPPORT.md) | Getting help | Users, contributors |

---

## 🛠️ How It Works

### Default Community Health Files

GitHub automatically uses files from this `.github` repository for any Tactic-Dev repository that doesn't have its own version:

```
User visits: github.com/Tactic-Dev/some-repo/blob/main/CONTRIBUTING.md
  ↓
  ├─ Repo has CONTRIBUTING.md? → Show repo version
  └─ No CONTRIBUTING.md? → Show .github repo version
```

This means:
- ✅ Instant documentation for all repositories
- ✅ Centralized maintenance (update once, apply everywhere)
- ✅ Repositories can override with custom versions
- ✅ New repositories get documentation automatically

### Repository Rulesets

Rulesets enforce branch protection and quality standards:

```
Developer pushes to main
  ↓
  ├─ Ruleset active? → Check rules
  │   ├─ PR required? → Block direct push
  │   ├─ CI must pass? → Check CI status
  │   ├─ Review required? → Check approvals
  │   └─ All good? → Allow merge
  └─ No ruleset? → Allow push (not recommended)
```

Three tiers available:
- **Tier 1**: Solo projects, experimentation
- **Tier 2**: Active projects, team collaboration
- **Tier 3**: Production systems, critical code

---

## 🎯 Repository Standards Summary

Every Tactic-Dev repository should have:

### Required ✅

- [ ] **README.md** - Project overview and documentation
- [ ] **LICENSE** - MIT license (default)
- [ ] **CONTRIBUTING.md** - Contribution guidelines (inherited or custom)
- [ ] **CODE_OF_CONDUCT.md** - Community standards (inherited or custom)
- [ ] **SECURITY.md** - Security policy (inherited or custom)
- [ ] **Issue Templates** - Standardized issue reporting
- [ ] **PR Template** - Consistent pull request process
- [ ] **Branch Protection** - Rulesets for main branch
- [ ] **Metadata** - Description, topics, homepage

### Recommended ⚠️

- [ ] **CHANGELOG.md** - Version history
- [ ] **SUPPORT.md** - Support resources (inherited or custom)
- [ ] **CI/CD** - Automated testing and building
- [ ] **Documentation** - Extended docs in `docs/` folder
- [ ] **.gitignore** - Language-appropriate ignore rules

### Security Features 🔒

- [ ] **Dependabot alerts** - Vulnerability notifications
- [ ] **Dependabot updates** - Automated dependency updates
- [ ] **Secret scanning** - Detect leaked credentials
- [ ] **Code scanning** - Static analysis (if applicable)

---

## 🤖 Automation

### Scripts

Located in [`scripts/`](scripts/):

#### Apply Rulesets
```bash
# Apply tier2 to all repos
./apply-rulesets.sh tier2

# Apply tier2 to specific repo
./apply-rulesets.sh tier2 loom-lang
```

#### Audit Repositories
```bash
# Output to console
./audit-repos.sh

# Save to file
./audit-repos.sh audit-report.md
```

### GitHub Actions

Workflow templates in [`workflow-templates/`](workflow-templates/):

- **ci.yml** - Standard CI workflow
- **rust-ci.yml** - Rust-specific CI

---

## 📊 Current Repository Status

| Repository | Documentation | Rulesets | Recommended Tier |
|------------|---------------|----------|------------------|
| .github | ✅ Complete | Pending | Tier 2 |
| loom-lang | ⚠️ Partial | Pending | Tier 2 |

**Last Audit**: See [scripts/audit-repos.sh](scripts/audit-repos.sh) to run current audit

---

## 🎓 Learning Resources

### Tactic Dev

- [Organization Profile](https://github.com/Tactic-Dev)
- [Tactic Dev Website](https://tacticdev.com)
- [GitHub Discussions](https://github.com/orgs/Tactic-Dev/discussions)

### GitHub Documentation

- [Default Community Health Files](https://docs.github.com/en/communities/setting-up-your-project-for-healthy-contributions/creating-a-default-community-health-file)
- [About Rulesets](https://docs.github.com/en/repositories/configuring-branches-and-merges-in-your-repository/managing-rulesets/about-rulesets)
- [Repository Security](https://docs.github.com/en/code-security)

### Best Practices

- [Contributor Covenant](https://www.contributor-covenant.org/)
- [Keep a Changelog](https://keepachangelog.com/)
- [Semantic Versioning](https://semver.org/)
- [Conventional Commits](https://www.conventionalcommits.org/)

---

## 🤝 Contributing

This repository defines standards for the entire organization. Contributions are welcome!

### Suggesting Changes

1. Open an [issue](https://github.com/Tactic-Dev/.github/issues) to discuss proposed changes
2. Start a [discussion](https://github.com/orgs/Tactic-Dev/discussions) for broader topics
3. Submit a [pull request](https://github.com/Tactic-Dev/.github/pulls) with improvements

### What to Contribute

- Improvements to documentation
- New template variations
- Script enhancements
- Workflow templates
- Best practice updates

---

## 📝 Maintenance

### Regular Updates

**Monthly**:
- Review and merge Dependabot PRs
- Check for outdated documentation
- Review new GitHub features

**Quarterly**:
- Audit all default files
- Update ruleset configurations
- Review and improve scripts
- Update examples and templates

**Annually**:
- Comprehensive documentation review
- Update LICENSE copyright year
- Review industry best practices
- Major version updates to templates

### Version History

| Date | Version | Changes |
|------|---------|---------|
| 2025-12-03 | 1.0 | Initial comprehensive setup |

---

## 🙋 Getting Help

Need assistance with repository setup or standards?

1. **Check the docs**: Start with [IMPLEMENTATION_GUIDE.md](IMPLEMENTATION_GUIDE.md)
2. **Run an audit**: Use `scripts/audit-repos.sh` to identify issues
3. **Ask in Discussions**: [GitHub Discussions](https://github.com/orgs/Tactic-Dev/discussions)
4. **Open an issue**: [Create an issue](https://github.com/Tactic-Dev/.github/issues/new/choose)
5. **Review examples**: Look at other Tactic-Dev repositories

---

## 🌟 Projects Using These Standards

- **[loom-lang](https://github.com/Tactic-Dev/loom-lang)** - AI-powered programming language for declarative automation

---

## 📜 License

The documentation and templates in this repository are available under the MIT License.

See [LICENSE](LICENSE) for details.

---

## 🏆 Acknowledgments

- **Contributor Covenant** - Code of Conduct framework
- **GitHub Community** - Best practices and templates
- **Open Source Community** - Inspiration and standards

---

<div align="center">

> *"Automation isn't about replacing creativity — it's about removing friction."*  
> — **Tyler Hill**, Principal Developer @ [Tactic Dev](https://tacticdev.com)

**Maintained with ❤️ by the Tactic Dev Team**

[Website](https://tacticdev.com) • [GitHub](https://github.com/Tactic-Dev) • [Discussions](https://github.com/orgs/Tactic-Dev/discussions)

</div>
