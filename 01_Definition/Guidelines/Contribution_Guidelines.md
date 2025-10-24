# Contribution Guidelines

**Version:** 1.0  
**Last Updated:** Phase 2 (Week 3-4)  
**Purpose:** Guide for proposing changes and contributing to ELA project guidelines and templates

---

## Welcome Contributors!

Thank you for your interest in improving the ELA (Enterprise-Level Architecture) project documentation. These guidelines will help you contribute effectively.

---

## How to Contribute

### Types of Contributions Welcome
- **Template improvements:** Enhance existing templates with better structure or examples
- **New guidelines:** Propose new guides for emerging needs
- **Bug fixes:** Correct errors, broken links, or typos
- **Clarifications:** Improve unclear sections
- **New terms:** Add definitions to Glossary.md
- **Best practices:** Share lessons learned from using these guidelines

---

## Contribution Process

### 1. Before You Start
- **Check existing issues:** Look for open issues related to your proposed change
- **Review existing docs:** Ensure your contribution aligns with the project's style and structure
- **Discuss major changes:** For significant additions or restructuring, open an issue first to discuss with maintainers

### 2. Making Changes

#### Small Changes (Typos, Minor Clarifications)
1. Navigate to the file on GitHub
2. Click the "Edit" (pencil) icon
3. Make your changes
4. Scroll down and add a clear commit message
5. Select "Create a new branch for this commit and start a pull request"
6. Submit the pull request

#### Larger Changes (New Sections, Restructuring)
1. Fork the repository
2. Create a new branch: `git checkout -b feature/your-feature-name`
3. Make your changes
4. Commit with clear, descriptive messages: `git commit -m "Add threat modeling examples for microservices"`
5. Push to your fork: `git push origin feature/your-feature-name`
6. Open a pull request from your fork to the main repository

### 3. Pull Request Guidelines

**PR Title Format:**
- Use clear, descriptive titles
- Examples:
  - "Fix: Correct STRIDE acronym typo in Threat_Modeling_Guide"
  - "Enhancement: Add performance NFR examples to Requirements_Document_Template"
  - "New: Add API security checklist to Review_Checklist"

**PR Description Should Include:**
- **What:** Brief description of your changes
- **Why:** Reason for the change or problem being solved
- **How:** Approach taken (for non-trivial changes)
- **Testing:** How you validated the change (if applicable)
- **Related Issues:** Link to any related issues

**Example PR Description:**
```
## What
Added examples of data flow diagrams to the Threat Modeling Guide.

## Why
New users were confused about how to create DFDs. Adding concrete examples will help.

## How
Included a simple web app example and a microservices example with clear component labels.

## Testing
Reviewed with 3 team members who confirmed the examples are clear and helpful.

## Related Issues
Closes #42
```

### 4. Review Process
- Maintainers will review your PR within 3-5 business days
- Address feedback promptly
- Once approved, a maintainer will merge your PR
- Your contribution will be acknowledged in the change log

---

## Contribution Standards

### Writing Style
- **Clear and concise:** Use simple language, avoid jargon (or define it)
- **Action-oriented:** Use imperative mood for instructions ("Click the button" not "You should click")
- **Inclusive:** Use gender-neutral language ("they" instead of "he/she")
- **Consistent:** Match the style and tone of existing documents
- **Examples:** Include practical examples where possible

### Formatting Guidelines
- Use Markdown formatting consistently
- Headers: Use sentence case ("Threat modeling process" not "Threat Modeling Process")
- Lists: Use `-` for unordered lists, `1.` for ordered
- Code blocks: Use triple backticks with language identifier (` ```python `)
- Links: Use descriptive link text, not "click here"
- Tables: Align columns for readability in source

### Template Structure
When creating or modifying templates:
- Include version number and last updated date at the top
- Add a "Purpose" section explaining when to use the template
- Use placeholder text in [brackets] for user-customizable sections
- Include inline examples and instructions
- Add a "How to Use" section at the end

### Documentation Principles
1. **Completeness:** Cover all necessary information without overwhelming
2. **Accuracy:** Ensure technical correctness
3. **Maintainability:** Write docs that are easy to update
4. **Accessibility:** Consider readers with varying expertise levels
5. **Traceability:** Link related documents together

---

## What We're Looking For

### High-Priority Contributions
- Real-world examples from your projects (anonymized)
- Industry-specific adaptations (finance, healthcare, etc.)
- Tool recommendations with usage guides
- Integration with CI/CD pipelines
- Compliance mapping (GDPR, HIPAA, SOC 2)

### Areas for Improvement
- More visual aids (diagrams, flowcharts)
- Video tutorials or walkthrough guides
- Templates for different project types (web app, API, data pipeline)
- Automation scripts for common tasks
- Integration with popular tools (Jira, Confluence, etc.)

---

## Code of Conduct

### Our Commitment
We are committed to providing a welcoming, inclusive environment for all contributors.

### Expected Behavior
- **Be respectful:** Value diverse perspectives and experiences
- **Be constructive:** Provide helpful feedback
- **Be collaborative:** Work together to improve the project
- **Be professional:** Keep discussions focused on the work

### Unacceptable Behavior
- Harassment, discrimination, or personal attacks
- Trolling, insulting, or derogatory comments
- Publishing others' private information
- Other conduct inappropriate in a professional setting

### Reporting
If you experience or witness unacceptable behavior, please contact the project maintainers.

---

## Getting Help

### Questions About Contributing?
- **Open an issue:** For general questions about the contribution process
- **Discussion forums:** Join community discussions (if available)
- **Reach out:** Contact maintainers directly for sensitive matters

### Need Help Using These Guidelines?
- Check the README.md for an overview
- Review existing documents for examples
- Look at closed PRs to see how others have contributed
- Don't hesitate to ask questions in your PR

---

## Recognition

### Contributors
All contributors will be:
- Acknowledged in commit history
- Listed in the project's contributors section (if applicable)
- Thanked for their valuable input

### Significant Contributions
Major contributions (new guides, significant restructuring) will be:
- Highlighted in release notes
- Referenced in the change log
- Acknowledged in the document itself (where appropriate)

---

## License

By contributing, you agree that your contributions will be licensed under the same license as the ELA-Main repository.

---

## Version History

| Version | Date | Changes | Contributor |
|---------|------|---------|-------------|
| 1.0 | Phase 2 (Week 3-4) | Initial contribution guidelines | ELA Team |

---

**Thank you for contributing to the ELA project! Your input helps improve documentation for everyone.**
