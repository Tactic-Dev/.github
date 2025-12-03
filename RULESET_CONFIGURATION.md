# Repository Ruleset Configuration for Tactic Dev

This document provides specific instructions and JSON configurations for setting up repository rulesets across all Tactic Dev repositories.

## 📋 Table of Contents

- [Overview](#overview)
- [Ruleset Tiers](#ruleset-tiers)
- [Setup Methods](#setup-methods)
- [Configuration Files](#configuration-files)
- [Implementation Guide](#implementation-guide)
- [Verification](#verification)
- [Troubleshooting](#troubleshooting)

## 🎯 Overview

GitHub Rulesets provide a modern, flexible way to protect branches and enforce repository policies. Unlike legacy branch protection rules, rulesets offer:

- **Better targeting** - Apply rules to multiple branches with patterns
- **Bypass options** - Fine-grained control over who can bypass rules
- **Insights** - Better visibility into rule enforcement
- **Organization-level** - Can be applied across multiple repositories

## 📊 Ruleset Tiers

Tactic Dev uses three standard ruleset tiers based on project requirements:

### Tier 1: Solo Development (Default)

**Use Case**: Personal projects, experimental repos, early-stage development

**Protection Level**: Basic

**Rules**:
- Require pull request (self-merge allowed)
- Require CI to pass (if CI exists)
- Block force pushes
- Allow admin bypass

**Recommended For**:
- Experimental projects
- Learning repositories
- Early-stage prototypes
- Solo developer projects

### Tier 2: Standard Team (Recommended)

**Use Case**: Active projects with regular contributions

**Protection Level**: Standard

**Rules**:
- Require pull request with 1 approval
- Dismiss stale reviews on new commits
- Require all CI checks to pass
- Require branches to be up to date
- Block force pushes
- Block branch deletion
- Allow admin bypass for emergencies

**Recommended For**:
- Active open-source projects
- Small team collaborations
- Production-ready projects
- Customer-facing applications

### Tier 3: Critical/Production (Strict)

**Use Case**: Production systems, critical infrastructure

**Protection Level**: Maximum

**Rules**:
- Require pull request with 2+ approvals
- Require code owner review
- Dismiss stale reviews on new commits
- Require all CI checks to pass
- Require branches to be up to date
- Require signed commits
- Require linear history
- Block force pushes
- Block branch deletion
- Restrict who can push
- Limited admin bypass

**Recommended For**:
- Production deployments
- Security-critical code
- Financial/compliance systems
- Public APIs with SLA commitments

## 🛠️ Setup Methods

### Method 1: GitHub Web UI (Easiest)

**Best for**: Setting up individual repositories

1. Navigate to repository **Settings**
2. Go to **Rules** → **Rulesets**
3. Click **New ruleset** → **New branch ruleset**
4. Configure according to tier (see configurations below)
5. Click **Create**

### Method 2: GitHub CLI (Scripted)

**Best for**: Automating setup across multiple repositories

```bash
# Install GitHub CLI if not already installed
# macOS: brew install gh
# Linux: See https://github.com/cli/cli/blob/trunk/docs/install_linux.md
# Windows: winget install --id GitHub.cli

# Authenticate
gh auth login

# Create ruleset (requires GitHub CLI extension or API call)
gh api \
  --method POST \
  -H "Accept: application/vnd.github+json" \
  /repos/Tactic-Dev/REPO_NAME/rulesets \
  --input ruleset-tier1.json
```

### Method 3: GitHub REST API

**Best for**: Full automation, infrastructure as code

See configuration files below and use with your preferred API client.

## 📄 Configuration Files

### Tier 1: Solo Development

**File**: `rulesets/tier1-solo-development.json`

```json
{
  "name": "Protect main branch (Solo Dev)",
  "target": "branch",
  "enforcement": "active",
  "conditions": {
    "ref_name": {
      "include": [
        "refs/heads/main"
      ],
      "exclude": []
    }
  },
  "rules": [
    {
      "type": "pull_request",
      "parameters": {
        "required_approving_review_count": 0,
        "dismiss_stale_reviews_on_push": false,
        "require_code_owner_review": false,
        "require_last_push_approval": false,
        "required_review_thread_resolution": false
      }
    },
    {
      "type": "required_status_checks",
      "parameters": {
        "required_status_checks": [
          {
            "context": "build",
            "integration_id": null
          }
        ],
        "strict_required_status_checks_policy": false
      }
    },
    {
      "type": "non_fast_forward"
    }
  ],
  "bypass_actors": [
    {
      "actor_id": 5,
      "actor_type": "RepositoryRole",
      "bypass_mode": "always"
    }
  ]
}
```

### Tier 2: Standard Team

**File**: `rulesets/tier2-standard-team.json`

```json
{
  "name": "Protect main branch (Standard)",
  "target": "branch",
  "enforcement": "active",
  "conditions": {
    "ref_name": {
      "include": [
        "refs/heads/main"
      ],
      "exclude": []
    }
  },
  "rules": [
    {
      "type": "pull_request",
      "parameters": {
        "required_approving_review_count": 1,
        "dismiss_stale_reviews_on_push": true,
        "require_code_owner_review": false,
        "require_last_push_approval": false,
        "required_review_thread_resolution": true
      }
    },
    {
      "type": "required_status_checks",
      "parameters": {
        "required_status_checks": [
          {
            "context": "build",
            "integration_id": null
          },
          {
            "context": "test",
            "integration_id": null
          },
          {
            "context": "lint",
            "integration_id": null
          }
        ],
        "strict_required_status_checks_policy": true
      }
    },
    {
      "type": "non_fast_forward"
    },
    {
      "type": "deletion"
    }
  ],
  "bypass_actors": [
    {
      "actor_id": 5,
      "actor_type": "RepositoryRole",
      "bypass_mode": "always"
    }
  ]
}
```

### Tier 3: Critical/Production

**File**: `rulesets/tier3-critical-production.json`

```json
{
  "name": "Protect main branch (Critical)",
  "target": "branch",
  "enforcement": "active",
  "conditions": {
    "ref_name": {
      "include": [
        "refs/heads/main",
        "refs/heads/production",
        "refs/heads/release/*"
      ],
      "exclude": []
    }
  },
  "rules": [
    {
      "type": "pull_request",
      "parameters": {
        "required_approving_review_count": 2,
        "dismiss_stale_reviews_on_push": true,
        "require_code_owner_review": true,
        "require_last_push_approval": true,
        "required_review_thread_resolution": true
      }
    },
    {
      "type": "required_status_checks",
      "parameters": {
        "required_status_checks": [
          {
            "context": "build",
            "integration_id": null
          },
          {
            "context": "test",
            "integration_id": null
          },
          {
            "context": "lint",
            "integration_id": null
          },
          {
            "context": "security-scan",
            "integration_id": null
          },
          {
            "context": "coverage",
            "integration_id": null
          }
        ],
        "strict_required_status_checks_policy": true
      }
    },
    {
      "type": "required_signatures"
    },
    {
      "type": "non_fast_forward"
    },
    {
      "type": "deletion"
    },
    {
      "type": "required_linear_history"
    }
  ],
  "bypass_actors": []
}
```

## 📖 Implementation Guide

### Step-by-Step Setup

#### For Individual Repositories

1. **Choose Your Tier**
   - Review the three tiers above
   - Select based on project requirements
   - Consider team size and criticality

2. **Prepare Your Repository**
   ```bash
   # Ensure CI is set up (for Tier 1+)
   # Check that .github/workflows/ contains CI configuration
   
   # Ensure CODEOWNERS exists (for Tier 3)
   # Create .github/CODEOWNERS if needed
   ```

3. **Apply the Ruleset**
   
   **Via Web UI:**
   - Settings → Rules → Rulesets → New branch ruleset
   - Name: "Protect main branch"
   - Target: main
   - Configure rules per tier
   - Save
   
   **Via API:**
   ```bash
   # Replace REPO_NAME and TIER
   gh api \
     --method POST \
     -H "Accept: application/vnd.github+json" \
     /repos/Tactic-Dev/REPO_NAME/rulesets \
     --input rulesets/tier2-standard-team.json
   ```

4. **Test the Ruleset**
   - Create a test branch
   - Make a small change
   - Open a PR
   - Verify rules are enforced
   - Try to merge (should require approval if Tier 2+)
   - Delete test branch

#### For All Tactic Dev Repositories

**Script**: `scripts/apply-rulesets.sh`

```bash
#!/bin/bash
# Apply rulesets to all Tactic Dev repositories

# Configuration
ORG="Tactic-Dev"
TIER="${1:-tier2}"  # Default to tier2
RULESET_FILE="rulesets/${TIER}-standard-team.json"

# Get all repos
repos=$(gh repo list "$ORG" --json name --jq '.[].name')

# Apply to each repo
for repo in $repos; do
  echo "Applying $TIER ruleset to $repo..."
  
  gh api \
    --method POST \
    -H "Accept: application/vnd.github+json" \
    "/repos/$ORG/$repo/rulesets" \
    --input "$RULESET_FILE" \
    2>&1 | grep -q "already exists" && echo "  ✓ Already configured" || echo "  ✓ Applied"
done

echo "Done! Applied rulesets to all repositories."
```

**Usage:**
```bash
# Apply tier2 to all repos
chmod +x scripts/apply-rulesets.sh
./scripts/apply-rulesets.sh tier2

# Apply tier1 to all repos
./scripts/apply-rulesets.sh tier1
```

### Current Tactic Dev Repository Recommendations

| Repository | Recommended Tier | Reason |
|------------|-----------------|---------|
| .github | Tier 2 | Organization configuration, active maintenance |
| loom-lang | Tier 2 | Active development, open-source project |
| (future repos) | Tier 1 or 2 | Based on project stage and team size |

## ✅ Verification

After applying rulesets, verify they work correctly:

### 1. Check Ruleset Status

```bash
# Via CLI
gh api /repos/Tactic-Dev/REPO_NAME/rulesets | jq '.[] | {name, enforcement}'

# Via Web
# Settings → Rules → Rulesets → Check "Active" status
```

### 2. Test with a PR

```bash
# Create test branch
git checkout -b test/ruleset-verification
echo "# Test" >> TEST.md
git add TEST.md
git commit -m "test: verify ruleset"
git push origin test/ruleset-verification

# Open PR
gh pr create --title "Test: Verify Ruleset" --body "Testing branch protection rules"

# Try to merge (should fail or require approval depending on tier)
gh pr merge --auto

# Clean up
gh pr close
git push origin --delete test/ruleset-verification
```

### 3. Verify Each Rule

**Tier 1/2/3 - Pull Request Required:**
- ✓ Cannot push directly to main
- ✓ Must create PR to merge

**Tier 2/3 - Approval Required:**
- ✓ PR requires N approvals before merge
- ✓ Stale reviews dismissed on new commits

**Tier 1/2/3 - CI Required:**
- ✓ All status checks must pass
- ✓ PR blocked if CI fails

**Tier 2/3 - Branch Up to Date:**
- ✓ Must update branch with main before merge
- ✓ Cannot merge stale branches

**Tier 3 - Code Owner Review:**
- ✓ Requires review from CODEOWNERS
- ✓ Cannot merge without owner approval

**Tier 3 - Signed Commits:**
- ✓ Rejects unsigned commits
- ✓ All commits must have GPG signature

**All Tiers - Force Push Blocked:**
- ✓ `git push --force` fails on main
- ✓ History cannot be rewritten

**Tier 2/3 - Deletion Blocked:**
- ✓ Cannot delete main branch
- ✓ Branch is protected from deletion

## 🐛 Troubleshooting

### Common Issues

#### Issue: "Status check required but not found"

**Problem**: Ruleset requires a CI check that doesn't exist

**Solution**:
```bash
# Option 1: Update ruleset to remove missing check
# Edit the ruleset in GitHub UI or update JSON

# Option 2: Add the missing CI workflow
# Create .github/workflows/[missing-check].yml
```

#### Issue: "Cannot bypass rules"

**Problem**: Even admins can't merge

**Solution**:
- Check bypass actors in ruleset configuration
- Ensure admin role is in bypass list
- Temporarily disable enforcement if needed

#### Issue: "Ruleset conflicts with branch protection rules"

**Problem**: Old branch protection rules still active

**Solution**:
```bash
# Remove old branch protection
# Settings → Branches → Delete old rules
# Keep only rulesets
```

#### Issue: "Required signatures but no GPG key"

**Problem**: Tier 3 requires signed commits but users haven't set up GPG

**Solution**:
```bash
# Set up GPG signing
# See: https://docs.github.com/en/authentication/managing-commit-signature-verification

# Or temporarily remove required_signatures from ruleset
```

### Testing Rulesets Without Impact

Use "evaluate" mode to test rulesets:

```json
{
  "enforcement": "evaluate",
  ...
}
```

This shows what would be blocked without actually blocking.

### Getting Help

- Check [GitHub Rulesets Documentation](https://docs.github.com/en/repositories/configuring-branches-and-merges-in-your-repository/managing-rulesets)
- Ask in [Tactic Dev Discussions](https://github.com/orgs/Tactic-Dev/discussions)
- Open an issue in the `.github` repository

## 📊 Monitoring and Maintenance

### Regular Reviews

**Monthly**:
- Review ruleset bypass usage
- Check for ruleset violations in insights
- Verify CI checks are still relevant

**Quarterly**:
- Review tier assignments
- Update required status checks
- Audit bypass permissions

**Annually**:
- Review all rulesets
- Update configurations as GitHub adds features
- Reassess tier assignments

### Metrics to Track

- PR merge time (before/after rulesets)
- Number of bypasses used
- CI failure rate on PRs
- Time to first review

## 🚀 Advanced Configurations

### Protecting Multiple Branches

```json
{
  "conditions": {
    "ref_name": {
      "include": [
        "refs/heads/main",
        "refs/heads/develop",
        "refs/heads/release/*",
        "refs/heads/hotfix/*"
      ]
    }
  }
}
```

### Different Rules for Different Branches

Create multiple rulesets with different targeting:

- **Ruleset 1**: main (Tier 3)
- **Ruleset 2**: develop (Tier 2)
- **Ruleset 3**: feature/* (Tier 1)

### Organization-Level Rulesets

Apply rules across all repos in Tactic-Dev:

```bash
gh api \
  --method POST \
  -H "Accept: application/vnd.github+json" \
  /orgs/Tactic-Dev/rulesets \
  --input org-ruleset.json
```

## 📚 Resources

- [GitHub Rulesets Documentation](https://docs.github.com/en/repositories/configuring-branches-and-merges-in-your-repository/managing-rulesets)
- [Branch Protection Migration Guide](https://docs.github.com/en/repositories/configuring-branches-and-merges-in-your-repository/managing-rulesets/migrating-from-branch-protection-rules)
- [GitHub CLI Documentation](https://cli.github.com/manual/)
- [Tactic Dev Repository Standards](REPOSITORY_STANDARDS.md)

## 📝 Changelog

| Date | Version | Changes |
|------|---------|---------|
| 2025-12-03 | 1.0 | Initial ruleset configuration guide |

---

> *"Good fences make good neighbors."* - Applied to code: Good rules make good collaboration.

**Maintained by** [Tactic Dev](https://tacticdev.com)
