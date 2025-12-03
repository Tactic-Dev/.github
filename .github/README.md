# Default Community Health Files

This directory contains default community health files that will be used by **all repositories** in the Tactic-Dev organization that don't have their own versions.

## 📋 How It Works

When a repository in Tactic-Dev doesn't have one of these files, GitHub automatically uses the version from this `.github` repository:

- `CONTRIBUTING.md` → Used if repo doesn't have its own
- `CODE_OF_CONDUCT.md` → Used if repo doesn't have its own
- `SECURITY.md` → Used if repo doesn't have its own
- `SUPPORT.md` → Used if repo doesn't have its own

## 🎯 Files in This Directory

### Available Now

These files are already available organization-wide:

- **CONTRIBUTING.md** - Contribution guidelines
- **CODE_OF_CONDUCT.md** - Community standards
- **SECURITY.md** - Security policy and vulnerability reporting

### To Be Added

Consider adding these for even better organization-wide defaults:

- **SUPPORT.md** - How to get support
- **FUNDING.yml** - Funding and sponsorship information

## 🔧 Customization

### For Individual Repositories

If a specific repository needs different policies:

1. Create the file in that repository's root or `.github/` directory
2. Customize it for that repo's needs
3. The repo's version will take precedence over this default

### Updating Organization Defaults

To update the defaults for all repositories:

1. Edit the files in this `.github` repository
2. Commit and push changes
3. The updated defaults will automatically apply to all repos without their own versions

## 📚 Best Practices

### When to Use Defaults

Use organization-wide defaults when:
- ✅ Policies are consistent across all projects
- ✅ You want to maintain centralized standards
- ✅ You want to simplify repository setup

### When to Override

Create repo-specific versions when:
- ⚠️ A project has unique contribution requirements
- ⚠️ Different security policies are needed
- ⚠️ Project-specific contact information is required

## 🔗 Related Documentation

- [GitHub Default Community Health Files](https://docs.github.com/en/communities/setting-up-your-project-for-healthy-contributions/creating-a-default-community-health-file)
- [Repository Standards](../REPOSITORY_STANDARDS.md)
- [Contributing Guidelines](../CONTRIBUTING.md)

---

**Maintained by** [Tactic Dev](https://tacticdev.com)
