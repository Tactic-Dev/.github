# Implementation Guide: Setting Up New Repositories

This guide walks you through setting up a new repository in the Tactic-Dev organization with all required documentation and protections.

## 🎯 Overview

By following this guide, your repository will have:

✅ Complete documentation suite
✅ Issue and PR templates
✅ Branch protection rulesets
✅ Proper metadata and configuration
✅ Security features enabled

## ⏱️ Time Required

- **Quick Setup** (using defaults): ~10 minutes
- **Custom Setup** (customized docs): ~30-45 minutes
- **Full Setup** (with CI/CD): ~1-2 hours

## 🚀 Quick Start (Recommended)

### Step 1: Create Repository

1. Go to [GitHub](https://github.com/orgs/Tactic-Dev/repositories)
2. Click **"New repository"**
3. Configure:
   - Name: `your-project-name`
   - Description: Clear, concise description of what it does
   - Visibility: Public (unless sensitive)
   - ✅ Initialize with README
   - Add .gitignore: Choose appropriate template
   - Choose license: MIT (recommended)

### Step 2: Add Repository Metadata

1. Go to repository **Settings**
2. In **About** section (top right), click the gear icon ⚙️
3. Fill in:
   - ✅ Description
   - ✅ Website (if applicable)
   - ✅ Topics (minimum 3-5): e.g., `python`, `automation`, `ai`
   - ✅ Check "Issues" if you want bug tracking
   - ✅ Consider enabling "Discussions" for community

### Step 3: Use Organization Defaults

The `.github` repository provides defaults for:
- ✅ CONTRIBUTING.md
- ✅ CODE_OF_CONDUCT.md
- ✅ SECURITY.md
- ✅ SUPPORT.md
- ✅ Issue templates
- ✅ PR template

**Your repository automatically inherits these!** No action needed unless you want custom versions.

### Step 4: Apply Branch Protection

```bash
# Clone the .github repository
git clone https://github.com/Tactic-Dev/.github.git
cd .github/scripts

# Apply tier2 ruleset (recommended for most projects)
./apply-rulesets.sh tier2 your-project-name
```

**Or manually via GitHub UI:**
1. Repository → Settings → Rules → Rulesets
2. Click "New ruleset" → "New branch ruleset"
3. Use tier2 configuration from `rulesets/tier2-standard-team.json`

### Step 5: Enable Security Features

1. Repository → Settings → Security
2. Enable:
   - ✅ Dependabot alerts
   - ✅ Dependabot security updates
   - ✅ Secret scanning
   - ✅ Code scanning (if applicable)

### Step 6: Test Everything

```bash
# Create a test branch
git checkout -b test/setup-verification
echo "# Test" >> TEST.md
git add TEST.md
git commit -m "test: verify setup"
git push origin test/setup-verification

# Open a test PR
gh pr create --title "Test: Verify Setup" --body "Testing templates and rulesets"

# Try to merge (should require review if tier2/tier3)
# Clean up after verification
gh pr close
git push origin --delete test/setup-verification
```

✅ **Done!** Your repository is fully configured.

## 🔧 Custom Setup (Advanced)

### When to Customize

Create custom documentation when:
- Project has unique contribution requirements
- Need project-specific security policies
- Want custom issue template fields
- Require specialized PR templates

### Customizing Documentation

#### 1. Custom CONTRIBUTING.md

```bash
# Copy organization template
cp /path/to/.github/CONTRIBUTING.md ./CONTRIBUTING.md

# Customize for your project
nano CONTRIBUTING.md

# Update sections:
# - Prerequisites (your project's specific needs)
# - Development setup (your project's setup steps)
# - Testing commands (your project's test commands)
# - Coding standards (your project's style guide)
```

#### 2. Custom Issue Templates

```bash
# Create directory
mkdir -p .github/ISSUE_TEMPLATE

# Copy organization templates
cp /path/to/.github/.github/ISSUE_TEMPLATE/* ./.github/ISSUE_TEMPLATE/

# Customize templates
# Edit fields, add project-specific questions
nano .github/ISSUE_TEMPLATE/bug_report.yml
nano .github/ISSUE_TEMPLATE/feature_request.yml
```

#### 3. Custom SECURITY.md

```bash
# Copy template
cp /path/to/.github/SECURITY.md ./SECURITY.md

# Customize:
# - Supported versions table
# - Contact information
# - Response timelines
# - Project-specific security considerations
nano SECURITY.md
```

### Adding CI/CD

#### GitHub Actions Workflow

```bash
# Create workflow directory
mkdir -p .github/workflows

# Create CI workflow
cat > .github/workflows/ci.yml << 'EOF'
name: CI

on:
  push:
    branches: [ main ]
  pull_request:
    branches: [ main ]

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - name: Set up Python
        uses: actions/setup-python@v4
        with:
          python-version: '3.11'
      - name: Install dependencies
        run: |
          pip install -r requirements.txt
          pip install -r requirements-dev.txt
      - name: Run tests
        run: pytest
      - name: Run linter
        run: |
          flake8 .
          black --check .
EOF
```

#### Update Ruleset for CI

After adding CI, update your ruleset to require CI checks:

```bash
# Update tier2 ruleset to require your CI check names
# Edit: rulesets/tier2-standard-team.json
# Add your CI job names to required_status_checks

# Reapply ruleset
cd .github/scripts
./apply-rulesets.sh tier2 your-project-name
```

## 📋 Detailed Checklist

### Initial Setup ☑️

- [ ] Repository created with appropriate name
- [ ] Repository description added (clear and concise)
- [ ] Repository visibility set (public/private)
- [ ] README.md initialized
- [ ] LICENSE added (MIT recommended)
- [ ] .gitignore added (language-appropriate)

### Metadata Configuration ☑️

- [ ] Description filled in
- [ ] Topics/tags added (minimum 3-5)
- [ ] Website URL added (if applicable)
- [ ] Social preview image uploaded (1280x640px)
- [ ] Repository features configured:
  - [ ] Issues enabled
  - [ ] Wiki (if needed)
  - [ ] Discussions (if desired)
  - [ ] Projects (if needed)

### Documentation ☑️

**Using Org Defaults:**
- [ ] Verified defaults are inherited correctly
- [ ] Tested links to default files work

**Custom (if needed):**
- [ ] README.md comprehensive and clear
- [ ] CONTRIBUTING.md added and customized
- [ ] CODE_OF_CONDUCT.md added
- [ ] SECURITY.md added and customized
- [ ] CHANGELOG.md created (if versioned project)
- [ ] SUPPORT.md customized (if needed)

### Templates ☑️

**Using Org Defaults:**
- [ ] Issue templates inherited
- [ ] PR template inherited

**Custom (if needed):**
- [ ] Bug report template customized
- [ ] Feature request template customized
- [ ] Documentation template customized
- [ ] Question template customized
- [ ] PR template customized
- [ ] Template config.yml configured

### Branch Protection ☑️

- [ ] Ruleset tier selected (tier1/tier2/tier3)
- [ ] Ruleset applied to main branch
- [ ] Tested with a pull request
- [ ] CI checks configured (if applicable)
- [ ] Bypass permissions reviewed

### Security ☑️

- [ ] Dependabot alerts enabled
- [ ] Dependabot security updates enabled
- [ ] Secret scanning enabled
- [ ] Code scanning enabled (if applicable)
- [ ] Security policy accessible
- [ ] No secrets in repository

### CI/CD (if applicable) ☑️

- [ ] GitHub Actions workflow created
- [ ] Build job configured
- [ ] Test job configured
- [ ] Lint job configured
- [ ] Status badges added to README
- [ ] CI checks required in ruleset

### Final Verification ☑️

- [ ] All links work (README, CONTRIBUTING, etc.)
- [ ] Templates work (create test issue/PR)
- [ ] Branch protection works (test PR approval)
- [ ] CI/CD runs successfully
- [ ] Security features active
- [ ] Documentation is comprehensive
- [ ] Repository is ready for contributors

## 🎓 Best Practices

### README.md

Your README is the first thing people see. Make it great:

```markdown
# Project Name

Brief description of what this does

[![Build Status](badge-url)](link)
[![License](badge-url)](link)

## Features

- Feature 1
- Feature 2
- Feature 3

## Installation

\`\`\`bash
# Installation commands
\`\`\`

## Usage

\`\`\`bash
# Usage examples
\`\`\`

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md)

## License

MIT - See [LICENSE](LICENSE)
```

### Commit Messages

Follow conventional commits:

```
feat: add new authentication system
fix: resolve memory leak in data processor
docs: update installation instructions
test: add unit tests for user service
chore: update dependencies
```

### Branching Strategy

Use descriptive branch names:

```
feature/add-user-authentication
fix/memory-leak-in-processor
docs/update-readme
refactor/improve-performance
test/add-integration-tests
```

## 🐛 Troubleshooting

### Issue: Templates not showing up

**Problem**: Issue/PR templates not appearing in repository

**Solution**: 
1. Check file paths: `.github/ISSUE_TEMPLATE/` and `.github/PULL_REQUEST_TEMPLATE.md`
2. Verify YAML syntax (use YAML validator)
3. Wait a few minutes for GitHub to update
4. Clear browser cache

### Issue: Branch protection not working

**Problem**: Can push directly to main despite ruleset

**Solution**:
1. Verify ruleset is "Active" not "Evaluate"
2. Check ruleset targets correct branch (`refs/heads/main`)
3. Verify you're not in bypass list
4. Check for conflicting legacy branch protection rules

### Issue: CI checks not required

**Problem**: PR can merge without CI passing

**Solution**:
1. Ensure CI workflow runs successfully first
2. Check CI job names match ruleset configuration
3. Update ruleset to include CI check names
4. Reapply ruleset: `./apply-rulesets.sh tier2 your-repo`

### Issue: Default docs not inherited

**Problem**: Organization defaults not showing in repository

**Solution**:
1. Verify `.github` repository has files in correct location
2. Check file names are exact matches (case-sensitive)
3. Ensure repository doesn't have its own version (overrides default)
4. Wait a few minutes for GitHub to sync

## 📚 Resources

### Tactic Dev Resources

- [Repository Standards](REPOSITORY_STANDARDS.md) - Complete standards guide
- [Ruleset Configuration](RULESET_CONFIGURATION.md) - Branch protection details
- [Scripts README](scripts/README.md) - Automation scripts guide

### GitHub Documentation

- [Creating a Repository](https://docs.github.com/en/repositories/creating-and-managing-repositories)
- [Default Community Health Files](https://docs.github.com/en/communities/setting-up-your-project-for-healthy-contributions/creating-a-default-community-health-file)
- [About Rulesets](https://docs.github.com/en/repositories/configuring-branches-and-merges-in-your-repository/managing-rulesets/about-rulesets)
- [GitHub Actions](https://docs.github.com/en/actions)

## 🤝 Getting Help

If you need assistance:

1. Check this guide and related documentation
2. Ask in [GitHub Discussions](https://github.com/orgs/Tactic-Dev/discussions)
3. Open an issue in the `.github` repository
4. Review existing repositories as examples

## 📊 Post-Setup

After setup, maintain your repository:

### Weekly
- Review and respond to issues/PRs
- Check CI/CD status
- Monitor security alerts

### Monthly
- Update dependencies
- Review open issues/PRs
- Update documentation if needed

### Quarterly
- Audit documentation completeness
- Review branch protection rules
- Update CHANGELOG
- Review security settings

## ✅ Verification

Run the audit script to verify your setup:

```bash
# From .github repository
cd scripts
./audit-repos.sh your-repo-audit.md

# Review the report
cat your-repo-audit.md
```

---

> *"A well-documented project is a successful project."*

**Maintained by** [Tactic Dev](https://tacticdev.com)
