# Security Policy

## Supported Versions

We take security seriously at Tactic Dev. This section outlines which versions of our projects are currently being supported with security updates.

| Project | Version | Supported          |
| ------- | ------- | ------------------ |
| loom-lang | latest (main) | :white_check_mark: |
| .github | latest (main) | :white_check_mark: |

For specific version support information, please refer to the individual repository's documentation.

## Reporting a Vulnerability

We appreciate your efforts to responsibly disclose your findings and will make every effort to acknowledge your contributions.

### How to Report a Security Vulnerability

**DO NOT** create a public GitHub issue for security vulnerabilities.

Instead, please report security vulnerabilities through one of the following methods:

#### Option 1: GitHub Security Advisories (Preferred)

1. Navigate to the repository's **Security** tab
2. Click on **"Report a vulnerability"**
3. Fill out the advisory form with details about the vulnerability
4. Submit the report

This is the preferred method as it allows us to work with you privately to understand and address the issue before public disclosure.

#### Option 2: Private Disclosure

If you're unable to use GitHub Security Advisories, you can:

1. Send a detailed report to the repository maintainers via GitHub private message
2. Include the word "SECURITY" in the subject line
3. Provide detailed information about the vulnerability (see below)

### What to Include in Your Report

To help us understand and address the issue quickly, please include:

- **Type of vulnerability** (e.g., XSS, SQL injection, privilege escalation)
- **Full paths of source file(s)** related to the vulnerability
- **Location of the affected source code** (tag/branch/commit or direct URL)
- **Step-by-step instructions** to reproduce the issue
- **Proof-of-concept or exploit code** (if possible)
- **Impact of the vulnerability** - what an attacker could do
- **Suggested remediation** (if you have ideas)
- **Your name/handle** for acknowledgment (optional)

### What to Expect

After you submit a vulnerability report:

1. **Acknowledgment** - We'll acknowledge receipt within 48 hours
2. **Assessment** - We'll assess the vulnerability and its impact
3. **Communication** - We'll keep you informed about our progress
4. **Resolution** - We'll work on a fix and coordinate disclosure timing with you
5. **Recognition** - With your permission, we'll acknowledge your contribution

### Response Timeline

- **Initial Response**: Within 48 hours
- **Status Update**: Within 7 days
- **Patch Development**: Varies based on complexity
- **Public Disclosure**: After patch is released (coordinated with reporter)

## Security Update Process

When a security vulnerability is fixed:

1. We'll develop and test a patch in a private repository
2. We'll create a security advisory (if using GitHub Security Advisories)
3. We'll release the patch and update the advisory
4. We'll notify users through:
   - GitHub Security Advisories
   - Release notes
   - Repository README (for critical vulnerabilities)

## Scope

### In Scope

The following are in scope for security vulnerability reports:

- **Code vulnerabilities** in any Tactic Dev repository
- **Dependency vulnerabilities** with active exploits
- **Authentication and authorization issues**
- **Data exposure or privacy concerns**
- **Code injection vulnerabilities**
- **Cryptographic weaknesses**
- **API security issues**

### Out of Scope

The following are generally out of scope:

- Vulnerabilities in third-party dependencies without active exploitation
- Issues requiring social engineering
- Denial of Service (DoS) attacks that require excessive resources
- Issues in outdated or unsupported versions
- Theoretical vulnerabilities without practical exploit
- Issues that require physical access to a device

## Security Best Practices for Contributors

When contributing to Tactic Dev projects:

### Code Security

- **Never commit secrets** (API keys, passwords, tokens) to the repository
- **Validate all input** from users and external sources
- **Use parameterized queries** to prevent SQL injection
- **Sanitize output** to prevent XSS attacks
- **Follow least privilege principle** in permission design
- **Keep dependencies updated** and monitor for vulnerabilities

### Dependency Security

- Run `npm audit`, `pip check`, or equivalent for your language
- Review dependency changes before accepting them
- Prefer well-maintained, popular libraries
- Check for known vulnerabilities in dependencies

### Authentication and Authorization

- Use established security libraries for authentication
- Implement proper session management
- Never roll your own crypto
- Use secure random number generators
- Implement rate limiting where appropriate

### Data Protection

- Encrypt sensitive data at rest and in transit
- Follow GDPR and data protection principles
- Minimize data collection and retention
- Implement proper access controls

## Security Tools and Resources

We recommend using these tools to identify security issues:

### Static Analysis
- **Python**: `bandit`, `safety`
- **JavaScript/Node.js**: `npm audit`, `eslint-plugin-security`
- **Rust**: `cargo-audit`, `cargo-clippy`

### Dependency Scanning
- **GitHub Dependabot** - Automated dependency updates
- **Snyk** - Vulnerability scanning
- **OWASP Dependency-Check** - OWASP maintained tool

### Best Practice Guides
- [OWASP Top 10](https://owasp.org/www-project-top-ten/)
- [CWE Top 25](https://cwe.mitre.org/top25/)
- [NIST Cybersecurity Framework](https://www.nist.gov/cyberframework)

## Vulnerability Disclosure Policy

### Coordinated Disclosure

We follow coordinated disclosure principles:

1. **Private reporting** - Vulnerabilities are reported privately
2. **Assessment and fixing** - We work on a fix before public disclosure
3. **Notification** - Affected users are notified when a fix is available
4. **Public disclosure** - Details are disclosed after patch is released
5. **Credit** - Researchers are credited for their findings (with permission)

### Disclosure Timeline

- **Day 0**: Vulnerability reported
- **Day 1-2**: Initial acknowledgment and assessment
- **Day 3-30**: Patch development and testing
- **Day 30-60**: Patch release and user notification
- **Day 60+**: Public disclosure (or earlier if actively exploited)

## Bug Bounty Program

At this time, Tactic Dev does not offer a formal bug bounty program. However:

- We deeply appreciate security researchers' efforts
- We will acknowledge contributors in security advisories (with permission)
- We may provide recognition in release notes and documentation
- We're open to discussing recognition options for significant findings

## Security Hall of Fame

We maintain a hall of fame for security researchers who help keep our projects secure:

<!-- Security contributors will be listed here -->

*No security vulnerabilities reported yet. Be the first to help secure our projects!*

## Questions?

If you have questions about this security policy or need clarification:

- Open a general (non-security) issue in the repository
- Start a discussion in [GitHub Discussions](https://github.com/orgs/Tactic-Dev/discussions)
- Review our [Contributing Guidelines](CONTRIBUTING.md)

## Policy Updates

This security policy may be updated from time to time. Check the git history for changes.

**Last Updated**: December 3, 2025

---

> *"Security is not a product, but a process."*  
> — **Bruce Schneier**

Thank you for helping keep Tactic Dev and our community safe! 🛡️
