#!/bin/bash
# Audit documentation across all Tactic Dev repositories
# Usage: ./audit-repos.sh [output-file]
#
# Example:
#   ./audit-repos.sh                    # Output to console
#   ./audit-repos.sh audit-report.md    # Output to file

set -e

# Configuration
ORG="Tactic-Dev"
OUTPUT_FILE="${1}"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Redirect output if file specified
if [ -n "$OUTPUT_FILE" ]; then
    # Use exec redirection in a way compatible with more shells
    if [ -w "$(dirname "$OUTPUT_FILE")" ] || [ ! -e "$OUTPUT_FILE" ]; then
        exec > "$OUTPUT_FILE" 2>&1
    else
        echo "Error: Cannot write to $OUTPUT_FILE"
        exit 1
    fi
fi

echo "# Tactic Dev Repository Documentation Audit"
echo ""
echo "**Organization**: ${ORG}"
echo "**Date**: $(date '+%Y-%m-%d %H:%M:%S')"
echo ""
echo "---"
echo ""

# Get all repos
echo "## Repositories"
echo ""
repos=$(gh repo list "$ORG" --limit 100 --json name,description,url,isPrivate,createdAt,updatedAt --jq '.[]')
repo_count=$(echo "$repos" | jq -s 'length')

echo "Found **${repo_count}** repositories in ${ORG}"
echo ""

# Function to check if file exists in repo
file_exists() {
    local repo=$1
    local file=$2
    gh api "/repos/${ORG}/${repo}/contents/${file}" &> /dev/null
    return $?
}

# Function to check repo metadata
check_repo_metadata() {
    local repo=$1
    gh api "/repos/${ORG}/${repo}" --jq '{description, topics, homepage, has_issues, has_wiki, has_discussions}'
}

# Audit each repository
echo "## Repository Details"
echo ""

echo "$repos" | jq -c '.' | while read -r repo_json; do
    repo=$(echo "$repo_json" | jq -r '.name')
    description=$(echo "$repo_json" | jq -r '.description // "No description"')
    url=$(echo "$repo_json" | jq -r '.url')
    is_private=$(echo "$repo_json" | jq -r '.isPrivate')
    created=$(echo "$repo_json" | jq -r '.createdAt')
    updated=$(echo "$repo_json" | jq -r '.updatedAt')
    
    echo "### 📦 ${repo}"
    echo ""
    echo "- **URL**: ${url}"
    echo "- **Description**: ${description}"
    echo "- **Visibility**: $([ "$is_private" = "true" ] && echo "Private 🔒" || echo "Public 🌐")"
    echo "- **Created**: ${created}"
    echo "- **Last Updated**: ${updated}"
    echo ""
    
    # Check metadata
    echo "#### Metadata"
    metadata=$(check_repo_metadata "$repo")
    topics=$(echo "$metadata" | jq -r '.topics | join(", ") // "None"')
    homepage=$(echo "$metadata" | jq -r '.homepage // "None"')
    has_issues=$(echo "$metadata" | jq -r '.has_issues')
    has_wiki=$(echo "$metadata" | jq -r '.has_wiki')
    has_discussions=$(echo "$metadata" | jq -r '.has_discussions')
    
    echo "- **Topics**: ${topics}"
    echo "- **Homepage**: ${homepage}"
    echo "- **Issues Enabled**: ${has_issues}"
    echo "- **Wiki Enabled**: ${has_wiki}"
    echo "- **Discussions Enabled**: ${has_discussions}"
    echo ""
    
    # Check required documentation files
    echo "#### Required Documentation"
    echo ""
    echo "| File | Status |"
    echo "|------|--------|"
    
    # README
    if file_exists "$repo" "README.md"; then
        echo "| README.md | ✅ Present |"
    else
        echo "| README.md | ❌ Missing |"
    fi
    
    # LICENSE
    if file_exists "$repo" "LICENSE" || file_exists "$repo" "LICENSE.md" || file_exists "$repo" "LICENSE.txt"; then
        echo "| LICENSE | ✅ Present |"
    else
        echo "| LICENSE | ❌ Missing |"
    fi
    
    # CONTRIBUTING
    if file_exists "$repo" "CONTRIBUTING.md" || file_exists "$repo" ".github/CONTRIBUTING.md"; then
        echo "| CONTRIBUTING.md | ✅ Present |"
    else
        echo "| CONTRIBUTING.md | ❌ Missing |"
    fi
    
    # CODE_OF_CONDUCT
    if file_exists "$repo" "CODE_OF_CONDUCT.md" || file_exists "$repo" ".github/CODE_OF_CONDUCT.md"; then
        echo "| CODE_OF_CONDUCT.md | ✅ Present |"
    else
        echo "| CODE_OF_CONDUCT.md | ❌ Missing |"
    fi
    
    # SECURITY
    if file_exists "$repo" "SECURITY.md" || file_exists "$repo" ".github/SECURITY.md"; then
        echo "| SECURITY.md | ✅ Present |"
    else
        echo "| SECURITY.md | ❌ Missing |"
    fi
    
    # CHANGELOG
    if file_exists "$repo" "CHANGELOG.md"; then
        echo "| CHANGELOG.md | ✅ Present |"
    else
        echo "| CHANGELOG.md | ⚠️ Recommended |"
    fi
    
    echo ""
    
    # Check templates
    echo "#### Templates"
    echo ""
    echo "| Type | Status |"
    echo "|------|--------|"
    
    # Issue templates
    if file_exists "$repo" ".github/ISSUE_TEMPLATE/bug_report.yml" || \
       file_exists "$repo" ".github/ISSUE_TEMPLATE/bug_report.md"; then
        echo "| Issue Templates | ✅ Present |"
    else
        echo "| Issue Templates | ❌ Missing |"
    fi
    
    # PR template
    if file_exists "$repo" ".github/PULL_REQUEST_TEMPLATE.md" || \
       file_exists "$repo" ".github/pull_request_template.md"; then
        echo "| PR Template | ✅ Present |"
    else
        echo "| PR Template | ❌ Missing |"
    fi
    
    echo ""
    
    # Check branch protection
    echo "#### Branch Protection"
    echo ""
    
    # Check if main branch has rulesets
    rulesets=$(gh api "/repos/${ORG}/${repo}/rulesets" --jq '.[] | select(.target == "branch") | .name' 2>/dev/null || echo "")
    
    if [ -n "$rulesets" ]; then
        echo "**Rulesets Configured:**"
        echo ""
        echo "$rulesets" | while read -r ruleset; do
            echo "- ✅ ${ruleset}"
        done
    else
        echo "- ❌ No branch protection rulesets configured"
    fi
    
    echo ""
    echo "---"
    echo ""
done

# Summary
echo "## Summary"
echo ""
echo "This audit checked for:"
echo ""
echo "✅ = Present and compliant"
echo "❌ = Missing or needs attention"
echo "⚠️ = Recommended but not required"
echo ""
echo "### Required Documentation Files"
echo ""
echo "- README.md"
echo "- LICENSE"
echo "- CONTRIBUTING.md"
echo "- CODE_OF_CONDUCT.md"
echo "- SECURITY.md"
echo ""
echo "### Recommended Documentation Files"
echo ""
echo "- CHANGELOG.md"
echo ""
echo "### Required Templates"
echo ""
echo "- Issue templates (bug, feature, docs, question)"
echo "- Pull request template"
echo ""
echo "### Required Protection"
echo ""
echo "- Branch protection rulesets for main branch"
echo ""
echo "### Next Steps"
echo ""
echo "1. Review repositories marked with ❌"
echo "2. Add missing documentation using templates from .github repo"
echo "3. Configure branch protection using \`scripts/apply-rulesets.sh\`"
echo "4. Update repository metadata (description, topics, homepage)"
echo "5. Re-run this audit after making changes"
echo ""
echo "---"
echo ""
echo "**Audit completed**: $(date '+%Y-%m-%d %H:%M:%S')"

if [ -n "$OUTPUT_FILE" ]; then
    echo ""
    echo "Report saved to: ${OUTPUT_FILE}"
fi
