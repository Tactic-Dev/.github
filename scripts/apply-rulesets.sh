#!/bin/bash
# Apply repository rulesets to Tactic Dev repositories
# Usage: ./apply-rulesets.sh [tier1|tier2|tier3] [repo-name]
#
# Examples:
#   ./apply-rulesets.sh tier2              # Apply tier2 to all repos
#   ./apply-rulesets.sh tier2 loom-lang    # Apply tier2 to specific repo
#   ./apply-rulesets.sh tier3 .github      # Apply tier3 to specific repo

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Configuration
ORG="Tactic-Dev"
TIER="${1:-tier2}"
SPECIFIC_REPO="${2}"
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
RULESETS_DIR="${SCRIPT_DIR}/../rulesets"

# Validate tier
if [[ ! "$TIER" =~ ^tier[1-3]$ ]]; then
    echo -e "${RED}Error: Invalid tier '${TIER}'. Must be tier1, tier2, or tier3.${NC}"
    exit 1
fi

# Check if ruleset file exists
RULESET_PATTERN="${RULESETS_DIR}/${TIER}-*.json"
RULESET_FILE=""
for file in ${RULESETS_DIR}/${TIER}-*.json; do
    if [ -f "$file" ]; then
        RULESET_FILE="$file"
        break
    fi
done

if [ -z "$RULESET_FILE" ]; then
    echo -e "${RED}Error: Ruleset file not found matching pattern: ${TIER}-*.json${NC}"
    exit 1
fi

echo -e "${GREEN}=== Tactic Dev Ruleset Application ===${NC}"
echo -e "Organization: ${ORG}"
echo -e "Tier: ${TIER}"
echo -e "Ruleset file: ${RULESET_FILE}"
echo ""

# Function to apply ruleset to a repository
apply_ruleset() {
    local repo=$1
    echo -e "${YELLOW}→${NC} Applying ${TIER} ruleset to ${repo}..."
    
    # Check if repo is accessible
    if ! gh repo view "${ORG}/${repo}" &> /dev/null; then
        echo -e "  ${RED}✗${NC} Cannot access repository ${repo}"
        return 1
    fi
    
    # Apply ruleset using GitHub API
    result=$(gh api \
        --method POST \
        -H "Accept: application/vnd.github+json" \
        "/repos/${ORG}/${repo}/rulesets" \
        --input "${RULESET_FILE}" 2>&1)
    
    if echo "$result" | grep -q "already exists\|created"; then
        echo -e "  ${GREEN}✓${NC} Ruleset applied successfully"
        return 0
    else
        echo -e "  ${YELLOW}!${NC} Note: ${result}"
        return 0
    fi
}

# Get list of repositories
if [ -n "$SPECIFIC_REPO" ]; then
    # Apply to specific repository
    echo "Target: Single repository (${SPECIFIC_REPO})"
    echo ""
    apply_ruleset "$SPECIFIC_REPO"
else
    # Apply to all repositories
    echo "Target: All repositories in ${ORG}"
    echo ""
    
    # Get all repos in the organization
    repos=$(gh repo list "$ORG" --limit 100 --json name --jq '.[].name')
    
    if [ -z "$repos" ]; then
        echo -e "${RED}Error: No repositories found in ${ORG}${NC}"
        exit 1
    fi
    
    count=0
    success=0
    
    # Apply to each repository
    for repo in $repos; do
        ((count++))
        if apply_ruleset "$repo"; then
            ((success++))
        fi
        echo ""
    done
    
    # Summary
    echo -e "${GREEN}=== Summary ===${NC}"
    echo -e "Total repositories: ${count}"
    echo -e "Successfully configured: ${success}"
    echo -e "Failed: $((count - success))"
fi

echo ""
echo -e "${GREEN}Done!${NC}"
echo ""
echo "Next steps:"
echo "1. Verify rulesets in GitHub UI: Settings → Rules → Rulesets"
echo "2. Test with a pull request to ensure rules work as expected"
echo "3. Adjust bypass permissions if needed"
