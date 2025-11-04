# Branch Protection Rules for Tactic-Dev Repositories

## Recommended Ruleset for `main` Branch

GitHub now uses **Rulesets** instead of legacy branch protection rules. Here's the recommended configuration:

### Create Ruleset via GitHub UI

1. **Navigate to Repository Settings**
   - Go to repository → Settings → Rules → Rulesets
   - Click "New ruleset" → "New branch ruleset"

2. **Ruleset Configuration**

   **Name:** `Protect main branch`
   
   **Enforcement status:** `Active`
   
   **Target branches:**
   - Include: `main`
   
   **Rules:**
   
   - ✅ **Require a pull request before merging**
     - Required approvals: 1
     - Dismiss stale pull request approvals when new commits are pushed: ✅
     - Require review from Code Owners: ⬜ (optional, if CODEOWNERS file exists)
   
   - ✅ **Require status checks to pass**
     - Require branches to be up to date before merging: ✅
     - Status checks that are required:
       - `build` (from CI workflow)
   
   - ✅ **Block force pushes**
   
   - ✅ **Require linear history** (optional - prevents merge commits)
   
   - ✅ **Require deployments to succeed** (optional - if using deployment protection)

3. **Bypass List** (Who can bypass rules)
   - Repository administrators: ✅ (allow admins to bypass in emergencies)
   - GitHub Apps: ⬜ (none needed)

### Alternative: REST API Configuration

```bash
# Create ruleset via GitHub CLI
gh api --method POST /repos/Tactic-Dev/tux-chat/rulesets \
  -H "Accept: application/vnd.github+json" \
  -f name='Protect main branch' \
  -f enforcement='active' \
  -f conditions='{"ref_name":{"include":["refs/heads/main"],"exclude":[]}}' \
  -f rules='[
    {
      "type": "pull_request",
      "parameters": {
        "required_approving_review_count": 1,
        "dismiss_stale_reviews_on_push": true,
        "require_code_owner_review": false
      }
    },
    {
      "type": "required_status_checks",
      "parameters": {
        "strict_required_status_checks_policy": true,
        "required_status_checks": [
          {"context": "build"}
        ]
      }
    },
    {
      "type": "non_fast_forward"
    }
  ]'
```

## Best Practices

### For Solo Projects (like tux-chat)
- **Require PR:** Even solo, PRs force you to review your own changes
- **Require CI:** Build must pass before merge
- **Block force push:** Prevents accidental history rewriting
- **Admin bypass:** Allow yourself to merge hotfixes in emergencies

### For Team Projects
- **Require 2 approvals:** More eyes on critical changes
- **Require code owner review:** Domain experts must approve
- **Require linear history:** Easier to bisect and understand
- **Restrict who can push:** Limit direct pushes to main

## Common Rulesets

### Minimal Protection (Solo Developer)
```
- Require pull request (0 approvals, just use PR workflow)
- Require CI to pass
- Block force pushes
```

### Standard Protection (Small Team)
```
- Require pull request (1 approval)
- Require CI to pass
- Require up-to-date branches
- Block force pushes
```

### Strict Protection (Production Code)
```
- Require pull request (2 approvals)
- Require code owner review
- Require CI to pass
- Require signed commits
- Require linear history
- Block force pushes
- Block deletions
```

## Setting Up

**Via GitHub Web UI (Easiest):**
1. Repository → Settings → Rules → Rulesets
2. New branch ruleset
3. Configure as above
4. Save

**Via GitHub CLI:**
```bash
gh repo edit Tactic-Dev/tux-chat --enable-branch-protection main
# Then configure rules in web UI
```

## Migration from Legacy Rules

If you have old branch protection rules:
1. Go to Settings → Branches
2. Note your existing rules
3. Create equivalent ruleset (Settings → Rules → Rulesets)
4. Delete old branch protection rule
5. Test with a PR

## References

- [GitHub Rulesets Documentation](https://docs.github.com/en/repositories/configuring-branches-and-merges-in-your-repository/managing-rulesets/about-rulesets)
- [Branch Protection Best Practices](https://docs.github.com/en/repositories/configuring-branches-and-merges-in-your-repository/managing-protected-branches/about-protected-branches)
