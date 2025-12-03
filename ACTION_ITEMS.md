# Action Items: Applying Repository Standards Organization-Wide

This document outlines the specific manual steps required to apply the new repository standards and rulesets across all Tactic-Dev repositories.

## 📋 Overview

**Status**: Documentation and automation complete ✅  
**Next Step**: Apply configurations to repositories  
**Time Required**: ~30 minutes for all repositories

## 🎯 Repositories to Configure

### Tactic-Dev/.github (This Repository)
- **Current Status**: Documentation complete, rulesets pending
- **Recommended Tier**: Tier 2 (Standard Team)
- **Action Required**: Apply tier2 ruleset

### Tactic-Dev/loom-lang
- **Current Status**: Basic docs present, templates and rulesets missing
- **Recommended Tier**: Tier 2 (Standard Team)
- **Action Required**: Apply tier2 ruleset

## 🚀 Quick Application (Automated)

If you have GitHub CLI configured with appropriate permissions:

```bash
# Clone this repository (if not already)
git clone https://github.com/Tactic-Dev/.github.git
cd .github/scripts

# Apply tier2 ruleset to all repositories
./apply-rulesets.sh tier2

# Run audit to verify
./audit-repos.sh post-application-audit.md
```

## 📝 Manual Application Steps

If you prefer to apply manually or don't have CLI access:

### Step 1: Apply Ruleset to .github Repository

1. **Navigate to Repository**
   - Go to https://github.com/Tactic-Dev/.github

2. **Open Ruleset Settings**
   - Click **Settings**
   - In left sidebar: **Rules** → **Rulesets**
   - Click **New ruleset** → **New branch ruleset**

3. **Configure Ruleset (Tier 2 - Standard Team)**
   
   **Basic Settings:**
   - Name: `Protect main branch (Standard)`
   - Enforcement status: **Active**
   - Target branches: `main`

   **Rules to Enable:**
   
   ✅ **Require a pull request before merging**
   - Required approvals: **1**
   - Dismiss stale reviews: **Yes**
   - Require code owner review: **No** (no CODEOWNERS yet)
   - Required review thread resolution: **Yes**

   ✅ **Require status checks to pass**
   - Require branches up to date: **Yes**
   - Status checks required: (add when CI is set up)
     - `build`
     - `test`
     - `lint`

   ✅ **Block force pushes**

   ✅ **Require linear history** (optional but recommended)

   ✅ **Block branch deletion**

   **Bypass Actors:**
   - Repository administrators: **Allow** (for emergency hotfixes)

4. **Save Ruleset**
   - Click **Create** or **Save changes**

5. **Verify**
   - Try pushing directly to main (should fail)
   - Create a test PR (should require approval)

### Step 2: Apply Ruleset to loom-lang Repository

1. **Navigate to Repository**
   - Go to https://github.com/Tactic-Dev/loom-lang

2. **Apply Same Configuration**
   - Follow same steps as above for .github repository
   - Use identical tier2 configuration

3. **Additional Considerations for loom-lang**
   - Has existing CI, so add status checks:
     - Any CI job names from `.github/workflows/`
   - Consider adding CODEOWNERS file if specific people own certain parts

### Step 3: Enable Security Features

For **both repositories**:

1. **Navigate to Security Settings**
   - Repository → **Settings** → **Code security and analysis**

2. **Enable Features**
   - ✅ **Dependabot alerts**: Enable
   - ✅ **Dependabot security updates**: Enable
   - ✅ **Secret scanning**: Enable (may already be enabled)
   - ✅ **Code scanning**: Configure (optional, for advanced security)

3. **Configure Dependabot**
   - Create `.github/dependabot.yml` if needed:
   ```yaml
   version: 2
   updates:
     - package-ecosystem: "pip"  # or "npm", "cargo", etc.
       directory: "/"
       schedule:
         interval: "weekly"
   ```

### Step 4: Verify Organization Defaults

1. **Check Default Files Work**
   - Visit any repository's contributing page:
     - https://github.com/Tactic-Dev/loom-lang/community
   - Verify it shows files from .github repo

2. **Test Issue Templates**
   - Go to https://github.com/Tactic-Dev/loom-lang/issues/new
   - Verify templates appear (bug, feature, docs, question)

3. **Test PR Template**
   - Create a test branch in any repo
   - Open a PR
   - Verify PR template appears

## 📊 Configuration Matrix

| Repository | Ruleset Tier | Status Checks | CODEOWNERS | Security Features |
|------------|--------------|---------------|------------|-------------------|
| .github | Tier 2 | To be added | Not needed | ✅ Enable all |
| loom-lang | Tier 2 | Existing CI | Optional | ✅ Enable all |

## ✅ Verification Checklist

### For Each Repository:

#### Rulesets ☑️
- [ ] Ruleset created and active
- [ ] Main branch protected
- [ ] Pull request required
- [ ] Status checks configured (if CI exists)
- [ ] Force push blocked
- [ ] Branch deletion blocked
- [ ] Tested with a PR

#### Security Features ☑️
- [ ] Dependabot alerts enabled
- [ ] Dependabot security updates enabled
- [ ] Secret scanning enabled
- [ ] Code scanning configured (if applicable)

#### Documentation ☑️
- [ ] Repository has description
- [ ] Topics/tags added (3-5 minimum)
- [ ] Homepage/website configured (if applicable)
- [ ] README is comprehensive
- [ ] Default org files inherited correctly

#### Templates ☑️
- [ ] Issue templates accessible
- [ ] PR template accessible
- [ ] Templates tested and working

#### Testing ☑️
- [ ] Created test branch
- [ ] Opened test PR
- [ ] Verified ruleset enforcement
- [ ] Verified templates appear
- [ ] Cleaned up test branch

## 🔍 Post-Application Audit

After applying configurations, run the audit script:

```bash
cd .github/scripts
./audit-repos.sh final-audit-$(date +%Y-%m-%d).md
```

**Expected Results:**
- ✅ All required documentation present
- ✅ All templates configured
- ✅ All rulesets active
- ✅ All security features enabled

## 🐛 Troubleshooting

### Issue: Cannot create ruleset

**Possible causes:**
- Insufficient permissions (need admin access)
- Browser/cache issue

**Solutions:**
1. Verify you have admin access to repository
2. Clear browser cache and retry
3. Use incognito/private window
4. Try different browser
5. Use GitHub CLI method instead

### Issue: Ruleset not enforcing

**Check:**
1. Ruleset status is "Active" not "Evaluate"
2. Branch name matches exactly (`main` vs `master`)
3. No conflicting legacy branch protection rules
4. Bypass list doesn't include your account unintentionally

**Fix:**
1. Edit ruleset, verify "Active" status
2. Delete any legacy branch protection rules (Settings → Branches)
3. Review bypass actors list
4. Test again with a new PR

### Issue: Templates not showing

**Check:**
1. File paths are correct (`.github/ISSUE_TEMPLATE/`, `.github/PULL_REQUEST_TEMPLATE.md`)
2. YAML syntax is valid
3. Wait 5-10 minutes for GitHub to process

**Fix:**
1. Validate YAML: https://www.yamllint.com/
2. Check file encoding is UTF-8
3. Clear browser cache
4. Wait and retry

### Issue: Status checks failing

**Check:**
1. CI workflow exists and runs
2. Job names match ruleset configuration
3. CI is passing on PRs

**Fix:**
1. Update ruleset to match actual CI job names
2. Fix CI if it's broken
3. Temporarily remove status check requirement until CI is fixed

## 📅 Timeline

**Immediate (Today):**
1. Apply rulesets to both repositories (~15 min)
2. Enable security features (~5 min)
3. Run verification audit (~5 min)
4. Test with a PR in each repo (~10 min)

**This Week:**
1. Set up CI for .github repo if desired
2. Add CODEOWNERS files if needed
3. Monitor for any issues
4. Address any problems that arise

**Ongoing:**
1. Monthly: Review security alerts
2. Quarterly: Audit documentation
3. As needed: Update rulesets and templates

## 📚 Reference Commands

### Using GitHub CLI

```bash
# List all rulesets in a repo
gh api /repos/Tactic-Dev/.github/rulesets | jq '.[] | {name, enforcement}'

# Apply ruleset to .github
cd .github/scripts
./apply-rulesets.sh tier2 .github

# Apply ruleset to loom-lang
./apply-rulesets.sh tier2 loom-lang

# Run audit
./audit-repos.sh
```

### Manual Testing

```bash
# Test direct push (should fail)
git checkout main
echo "test" >> README.md
git add README.md
git commit -m "test: direct push"
git push origin main  # Should be blocked

# Test via PR (should work)
git checkout -b test/ruleset-check
git push origin test/ruleset-check
gh pr create --title "Test: Ruleset" --body "Testing ruleset enforcement"
# Try to merge - should require approval
```

## 🎯 Success Criteria

Configuration is complete when:

✅ All repositories have active rulesets  
✅ Cannot push directly to main  
✅ PRs require approval before merge  
✅ Security features are active  
✅ Templates work in all repos  
✅ Audit shows all green checkmarks  
✅ Test PRs demonstrate enforcement  

## 📞 Need Help?

If you encounter issues:

1. **Check this document** - Most issues covered above
2. **Review logs** - GitHub provides detailed error messages
3. **Ask in Discussions** - [Tactic Dev Discussions](https://github.com/orgs/Tactic-Dev/discussions)
4. **Open an issue** - In this .github repository
5. **Check GitHub Status** - https://www.githubstatus.com/

## 📝 Completion Report

After completing all steps, document:

```markdown
## Repository Standards Application - Completion Report

**Date**: [Date]
**Applied by**: [Your name]

### Repositories Configured:
- [x] Tactic-Dev/.github - Tier 2 applied
- [x] Tactic-Dev/loom-lang - Tier 2 applied

### Features Enabled:
- [x] Rulesets active on all repos
- [x] Security features enabled
- [x] Templates accessible
- [x] Documentation inherited

### Issues Encountered:
- None / [List any issues]

### Next Steps:
- Monitor for first week
- Address any user feedback
- Plan quarterly review
```

## 🎉 Completion

Once all steps are complete:

1. ✅ Mark this document as completed
2. ✅ Archive audit reports
3. ✅ Update README with "Last Updated" date
4. ✅ Announce to team (if applicable)
5. ✅ Schedule first quarterly review

---

**Created**: December 3, 2025  
**Status**: Ready for implementation  
**Owner**: Repository administrators

---

> *"Well begun is half done."* - Aristotle

Let's make Tactic Dev repositories the gold standard! 🚀
