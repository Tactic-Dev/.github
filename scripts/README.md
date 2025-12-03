# Repository Management Scripts

This directory contains automation scripts for managing Tactic Dev repositories.

## 📜 Available Scripts

### 1. `apply-rulesets.sh`

Apply branch protection rulesets to repositories.

**Usage:**
```bash
# Apply tier2 ruleset to all repositories
./apply-rulesets.sh tier2

# Apply tier2 ruleset to a specific repository
./apply-rulesets.sh tier2 loom-lang

# Apply tier1 ruleset to all repositories
./apply-rulesets.sh tier1

# Apply tier3 ruleset to a specific repository
./apply-rulesets.sh tier3 .github
```

**Requirements:**
- GitHub CLI (`gh`) installed and authenticated
- Appropriate permissions to create rulesets

**Ruleset Tiers:**
- **tier1**: Solo development (minimal protection)
- **tier2**: Standard team (recommended)
- **tier3**: Critical/production (maximum protection)

### 2. `audit-repos.sh`

Audit documentation and configuration across all repositories.

**Usage:**
```bash
# Display audit results in console
./audit-repos.sh

# Save audit results to a file
./audit-repos.sh audit-report.md
```

**Requirements:**
- GitHub CLI (`gh`) installed and authenticated
- Read access to all repositories

**Checks:**
- ✅ Required documentation files
- ✅ Repository metadata (description, topics, homepage)
- ✅ Issue and PR templates
- ✅ Branch protection rulesets
- ✅ Repository features (issues, wiki, discussions)

## 🚀 Quick Start

### Prerequisites

1. **Install GitHub CLI**
   ```bash
   # macOS
   brew install gh
   
   # Linux (Ubuntu/Debian)
   sudo apt install gh
   
   # Windows
   winget install --id GitHub.cli
   ```

2. **Authenticate**
   ```bash
   gh auth login
   ```

3. **Verify Access**
   ```bash
   gh repo list Tactic-Dev
   ```

### Running an Audit

```bash
# Navigate to scripts directory
cd scripts

# Run audit
./audit-repos.sh audit-report.md

# Review the report
cat audit-report.md
```

### Applying Rulesets

```bash
# Review available rulesets
ls ../rulesets/

# Apply tier2 to all repos
./apply-rulesets.sh tier2

# Or apply to specific repo
./apply-rulesets.sh tier2 loom-lang
```

## 📋 Workflow Examples

### Complete Repository Setup Workflow

```bash
# 1. Run initial audit
./audit-repos.sh pre-setup-audit.md

# 2. Apply rulesets to all repos
./apply-rulesets.sh tier2

# 3. Run post-setup audit
./audit-repos.sh post-setup-audit.md

# 4. Compare reports
diff pre-setup-audit.md post-setup-audit.md
```

### Single Repository Setup

```bash
# Apply ruleset to specific repo
./apply-rulesets.sh tier2 my-repo

# Verify with focused audit (manual check in GitHub UI)
# Settings → Rules → Rulesets
```

### Regular Maintenance

```bash
# Monthly: Run audit and review
./audit-repos.sh monthly-audit-$(date +%Y-%m).md

# Quarterly: Review and update rulesets if needed
# Edit ../rulesets/tier2-standard-team.json
./apply-rulesets.sh tier2
```

## 🔧 Customization

### Modifying Rulesets

Edit the JSON files in `../rulesets/`:

```bash
# Edit tier2 ruleset
nano ../rulesets/tier2-standard-team.json

# Apply updated ruleset
./apply-rulesets.sh tier2
```

### Creating Custom Scripts

Follow the pattern of existing scripts:

```bash
#!/bin/bash
set -e
ORG="Tactic-Dev"
# Your script logic here
```

## 🐛 Troubleshooting

### "gh: command not found"

Install GitHub CLI (see Prerequisites above).

### "authentication required"

```bash
gh auth login
gh auth status  # Verify authentication
```

### "permission denied"

Ensure you have appropriate permissions:
- Repository admin access for applying rulesets
- Read access for running audits

### "ruleset already exists"

This is normal - the script will notify you that the ruleset is already configured.

### Script Won't Execute

Make script executable:
```bash
chmod +x apply-rulesets.sh
chmod +x audit-repos.sh
```

## 📚 Related Documentation

- [Repository Standards](../REPOSITORY_STANDARDS.md) - Complete documentation standards
- [Ruleset Configuration](../RULESET_CONFIGURATION.md) - Detailed ruleset guide
- [Branch Protection Rules](../branch-protection-rules.md) - Branch protection overview
- [Contributing Guidelines](../CONTRIBUTING.md) - How to contribute

## 🔄 Script Development

### Adding New Scripts

1. Create script in this directory
2. Make it executable: `chmod +x script-name.sh`
3. Add documentation to this README
4. Test thoroughly before committing

### Best Practices

- Use `set -e` to exit on errors
- Include usage information in comments
- Provide clear output messages
- Handle errors gracefully
- Test with both all repos and single repo

### Script Template

```bash
#!/bin/bash
# Script description and purpose
# Usage: ./script-name.sh [options]

set -e

# Configuration
ORG="Tactic-Dev"

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

# Your script logic here

echo -e "${GREEN}Done!${NC}"
```

## 🤝 Contributing

Improvements to these scripts are welcome! Please:

1. Test your changes thoroughly
2. Update this README with new functionality
3. Follow the existing code style
4. Submit a pull request

## 📝 Changelog

| Date | Script | Changes |
|------|--------|---------|
| 2025-12-03 | apply-rulesets.sh | Initial version - apply rulesets to repos |
| 2025-12-03 | audit-repos.sh | Initial version - audit repository documentation |

---

**Maintained by** [Tactic Dev](https://tacticdev.com)
